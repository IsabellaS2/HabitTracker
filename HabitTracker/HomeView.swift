//
//  HomeView.swift
//  HabitTracker
//
//  Created by Isabella Sulisufi on 16/04/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var habitArray: [HabitModel] = []
    @State private var isEnabled = false

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
                
                if habitArray.isEmpty {
                    Text("Looks like you don't have any habits. Why not add one?")
                        .padding(5.0)
                        .foregroundColor(Color("bodytext"))
                        .font(.system(size: 20))
                } else {
                    VStack {
                        ForEach(habitArray) { habit in
                            Button(action: {
                                // viewModel.navigateToSelectedBook(with: book)
                            }, label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        // Book title
                                        Text(habit.habitName)
                                            .foregroundColor((Color("bodytext")))
                                            .font(.system(size: 18))
                                            .multilineTextAlignment(.leading)
                                    }
                                    Image(systemName: habit.habitIcon.systemImage)
                                        .foregroundColor(habit.habitIcon.color)
                                        .frame(width: 30, height: 25)
                                    Spacer()

                                }
                                .padding()
                                .background((Color("rows")))
                                .cornerRadius(8)
                            })
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
