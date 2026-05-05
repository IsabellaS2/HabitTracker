//
//  HomeView.swift
//  HabitTracker
//
//  Created by Isabella Sulisufi on 16/04/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var habitArray: [HabitModel] = []

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Habit Tracker")
                        .foregroundColor((Color("headingtext")))
                        .font(.system(size: 28))
                        .fontWeight(.bold)

                    Spacer()
                    NavigationLink(destination: AddHabitView(habitArray: $habitArray)) {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(Color("background"))
                            .background(Color("button"))
                            .cornerRadius(25)
                    }
                }
                .padding()
                HStack {
                    Text(Date.now, format: .dateTime.weekday(.wide).day().month())
                        .foregroundColor(Color("bodytext"))
                        .padding(.bottom, 20)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding()

                let grouped = Dictionary(grouping: habitArray) { $0.habitIcon }

                if habitArray.isEmpty {
                    Text("Looks like you don't have any habits. Why not add one?")
                        .padding(5.0)
                        .foregroundColor(Color("bodytext"))
                        .font(.system(size: 20))
                } else {

                    ForEach(grouped.keys.sorted(by: { $0.title < $1.title }), id: \.self) { icon in
                        let habits = grouped[icon]!
                        VStack(alignment: .leading) {
                            Text(icon.title)
                                .foregroundColor(Color("bodytext"))
                                .font(.system(size: 20))
                                .fontWeight(.semibold)

                            VStack {
                                ForEach(habits) { habit in
                                    Button(action: {
                                        if let index = habitArray.firstIndex(where: { $0.id == habit.id }) {
                                            habitArray[index].isCompleted.toggle()
                                        }
                                    }, label: {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(habit.habitName)
                                                    .foregroundColor((Color("bodytext")))
                                                    .font(.system(size: 18))
                                                    .multilineTextAlignment(.leading)
                                            }

                                            Image(systemName: habit.habitIcon.systemImage)
                                                .foregroundColor(habit.habitIcon.color)
                                                .frame(width: 30, height: 25)
                                            Spacer()
                                            Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(habit.isCompleted ? Color("button") : Color("border"))

                                                .font(.title2)
                                        }
                                        .padding()
                                        .background((Color("rows")))
                                        .cornerRadius(8)
                                    })
                                }
                            }
                        }

                    }
                }
                Spacer()
            }
            .padding()
            .background(Color("background"))
            }
        }
}

#Preview {
    HomeView()
}
