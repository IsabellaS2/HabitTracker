//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Isabella Sulisufi on 16/04/2026.
//

import SwiftUI

struct AddHabitView: View {
    var body: some View {
        VStack {
            Text("Add Habit")
            
            HStack {
                Text("Habit Name")
                Spacer()
                TextField("e.g. Drink Water", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }

        }
        .padding()
    }
}

#Preview {
    AddHabitView()
}
