//
//  ContentView.swift
//  HabitTracker
//
//  Created by Francisco Manuel Gallegos Luque on 04/02/2025.
//

import SwiftUI

struct HabitActivity: Identifiable, Codable, Equatable {
    var id = UUID()
    var hours: Double
    let name: String
    let description: String
}

@Observable
class Habits {
    var activities = [HabitActivity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
        
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([HabitActivity].self, from: savedHabits) {
                activities = decodedHabits
                return
            }
        }
        
        activities = []
    }
}

struct ContentView: View {
    @State private var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (habits.activities) { activity in
                    NavigationLink ("\(activity.name)") {
                        ActivityView(activity: activity, habits: habits)
                    }
                }
                .onDelete(perform: removeItem)
            }
           
            .toolbar {
                Button ("Add habit", systemImage: "plus") {
                    showingAddHabit = true
                }
            }
            .navigationTitle("Habits")
            .sheet(isPresented: $showingAddHabit) {
                AddView(habits: habits)
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        habits.activities.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
