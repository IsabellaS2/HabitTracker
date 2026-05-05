# Habit Tracker

A minimal iOS habit tracking app built with SwiftUI.

## Features

- Add habits with a name and category icon
- Track daily completion with a tap
- Habits grouped by category on the home screen
- Clean empty state when no habits exist

## Screens

**Home** — displays the current date and all habits grouped by category. Tap the checkmark to toggle a habit complete or incomplete.

**Add Habit** — enter a habit name and pick from one of five category icons. Both fields are required; a validation sheet appears if either is missing.

## Habit Categories

| Icon | Category |
|------|----------|
| drop.fill | Hydration |
| figure.walk | Movement |
| book.fill | Reading |
| fork.knife | Nutrition |
| brain.head.profile | Mindfulness |

## Tech

- Swift / SwiftUI
- iOS 26.2+
- No external dependencies
- In-memory state only (no persistence between sessions)

## Project Structure

```
HabitTracker/
├── HabitTrackerApp.swift   # App entry point
├── HabitModel.swift        # Data model + Icon enum
└── Views/
    ├── HomeView.swift       # Habits list screen
    └── AddHabitView.swift   # Add habit form
```

## Getting Started

1. Clone the repo
2. Open `HabitTracker.xcodeproj` in Xcode
3. Run on a simulator or device (iOS 26.2+)
