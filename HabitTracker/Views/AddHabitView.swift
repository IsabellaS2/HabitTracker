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
    @State var showSheet = false
    @Binding var habitArray: [HabitModel]
    @Environment(\.dismiss) var dismiss

    func checkHabitEmpty() {
        if habit.isEmpty || selectedIcon == nil {
            showSheet = true
        } else {
            showSheet = false
        }
    }

    var body: some View {
        VStack {

            Text("Add Habit")
                .foregroundColor((Color("headingtext")))
                .font(.system(size: 28))
                .fontWeight(.bold)
                .padding(.bottom, 20)

            HStack {
                Text("Habit Name")
                    .foregroundColor((Color("headingtext")))
                    .fontWeight(.semibold)
                    .font(.system(size: 20))

                TextField("e.g. Drink Water", text: $habit)
                    .foregroundColor(Color("bodytext"))
                    .padding()
                    .background(Color("rows"))
                    .font(.system(size: 20))
                    .cornerRadius(10)

                Spacer()
            }
            .padding(.bottom, 40)

            Button(action: {
                if habit.isEmpty || selectedIcon == nil {
                    showSheet = true
                } else {
                    habitArray.append(HabitModel(habitName: habit, habitIcon: selectedIcon ?? .water))
                    dismiss()
                }

            }, label: {
                Text("Add Habit")
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor((Color("darktext")))
                    .background((Color("button")))
                    .cornerRadius(25)
            })
            .padding(.bottom, 40)
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 10) {
                    Text("Oops! Make sure you add a habit and select an icon")
                        .foregroundColor(Color("bodytext"))
                        .font(.system(size: 20))
                }
                .presentationDetents([.fraction(0.30)])
                .presentationDragIndicator(.visible)
            }
            .padding()
            .background(Color("background"))

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
                            : (Color("rows"))
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
        .background(Color("background"))
    }
}

#Preview {
    AddHabitView(habitArray: .constant([]))
}
