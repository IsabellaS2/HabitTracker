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
                    Spacer()
                    NavigationLink(destination: AddHabitView(habitArray: $habitArray)) {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(25)
                    }
                }
                .padding()
                Text(Date.now, format: .dateTime.weekday(.wide).day().month())
                    .padding(.bottom, 40)
                
                HStack {
                    Text("Drink Water")
                    Spacer()
                    Toggle("Is habit complete", isOn: $isEnabled)
                        .labelsHidden()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(25)
                
                VStack {
                    ForEach(habitArray) { habit in
                        Button(action: {
                            // viewModel.navigateToSelectedBook(with: book)
                        }, label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    // Book title
                                    Text(habit.habitName)
                                        .foregroundColor(Color.white)
                                        .font(Font.custom("Iowan Old Style", size: 18))
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                                Image(systemName: habit.habitIcon.systemImage)
                                    .resizable()
                                    .frame(width: 30, height: 25)
                                    .foregroundColor(Color.blue)
                            }
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                        })
                    }
                }
                Spacer()

                Text("\(habitArray.count)")

                
            }
            .padding()
            .background(Color.yellow)
        }
    }
}
#Preview {
    HomeView()
}
