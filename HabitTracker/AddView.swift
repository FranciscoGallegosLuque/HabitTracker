//
//  AddView.swift
//  HabitTracker
//
//  Created by Francisco Manuel Gallegos Luque on 04/02/2025.
//

//
//  AddView.swift
//  iExpense
//
//  Created by Francisco Manuel Gallegos Luque on 27/01/2025.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    @State private var hours = 0.0
    
    var habits: Habits

    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit", text: $name)
                TextField("Description", text: $description)
 
            }
            .navigationTitle("Add habit")
            .toolbar {
                ToolbarItem {
                    Button("Save") {
                        let activity = HabitActivity(hours: hours, name: name, description: description)
                        habits.activities.append(activity)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                                dismiss()
                            }
                }
                
            }
            .navigationBarBackButtonHidden()
            
        }
    }
}
#Preview {
    AddView(habits: Habits())
}
