//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Francisco Manuel Gallegos Luque on 07/02/2025.
//

import SwiftUI

struct ActivityView: View {
    var activity: HabitActivity
    var habits: Habits
    
    var body: some View {
        
        NavigationStack {
            List {
                Text("Count: \(activity.hours.formatted())")
                Text("\(activity.description)")
            }
            .navigationTitle(activity.name)
            .toolbar{
                Button {
                    addHour()
                } label: {
                    Label("Add hour", systemImage: "plus")
                }
            }
        }
    }
    
    func addHour() {
        var newActivity = activity
        newActivity.hours += 1
        if let index = habits.activities.firstIndex(of: activity) {
            habits.activities[index] = newActivity
        }
    }
   
}

#Preview {
    
    ActivityView(activity: Habits().activities[0],
        habits: Habits())
}
