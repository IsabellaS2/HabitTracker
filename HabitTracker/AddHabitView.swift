//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Isabella Sulisufi on 16/04/2026.
//

import SwiftUI

struct AddHabitView: View {
    @State private var habit: String = ""
    @State private var selectedIcon: Icon?
    @Binding var habitArray: [HabitModel]


    var body: some View {
        VStack {
        
            Text("Add Habit")
                .font(.title)

            HStack {
                Text("Habit Name")
                    .font(.system(size: 20))

                
                Spacer()
                TextField("e.g. Drink Water", text: $habit)
                    .font(.system(size: 20))

            }
            .padding(30.0)
            
            Button(action: {
                habitArray.append(HabitModel(habitName: habit, habitIcon: selectedIcon ?? .water))
            }, label: {
                Text("Add Habit")
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(25)
            })
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 12) {
                ForEach(Icon.allCases) { icon in
                    Button {
                        selectedIcon = icon
                    } label: {
                        VStack(spacing: 8) {
                            Image(systemName: icon.systemImage)
                                .font(.title2)
                                .foregroundColor(icon.color)

                            Text(icon.title)
                                .font(.subheadline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            selectedIcon == icon
                            ? icon.color.opacity(0.15)
                            : Color(.secondarySystemBackground)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(selectedIcon == icon ? icon.color : .clear, lineWidth: 2)
                        )
                        .cornerRadius(16)
                    }
                    .buttonStyle(.plain)
                }
            }
            
            Spacer()

        }
        .padding()
        .background(Color.yellow)
    }
}

