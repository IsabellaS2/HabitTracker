//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Isabella Sulisufi on 16/04/2026.
//

import SwiftUI

struct HabitModel: Identifiable {
    var id = UUID()
    var habitName: String
    var habitIcon: Icon
    var isCompleted: Bool = false

//    let habitGoal: String
//    let habitNotes: String
}

enum Icon: CaseIterable, Identifiable {
    case water, movement, read, eat, meditate

    var id: Self { self }

    var systemImage: String {
        switch self {
        case .water: return "drop.fill"
        case .movement: return "figure.walk"
        case .read: return "book.fill"
        case .eat: return "fork.knife"
        case .meditate: return "brain.head.profile"
        }
    }

    var title: String {
        switch self {
        case .water: return "Hydration"
        case .movement: return "Movement"
        case .read: return "Reading"
        case .eat: return "Nutrition"
        case .meditate: return "Mindfulness"
        }
    }

    var color: Color {
        switch self {
        case .water: return .blue
        case .movement: return .green
        case .read: return .orange
        case .eat: return .red
        case .meditate: return .purple
        }
    }
}
