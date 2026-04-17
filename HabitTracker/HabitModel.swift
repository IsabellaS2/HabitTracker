//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Isabella Sulisufi on 16/04/2026.
//

struct HabitModel {
    let habitName: String
    let habitIcon: Icon
    let habitGoal: String
    let habitNotes: String
}

enum Icon {
    case water, movement, read, eat, meditate
}
