# Task Manager – Flutter App

A simple task manager built in Flutter: create a profile, view today's tasks
on a dashboard, and add new tasks — with English/Arabic localization, an
animated Lottie splash screen, and a fully responsive layout.

## Screens

| Login | Home / Dashboard | Add Task |
|---|---|---|
| ![Create Profile](screenshots/login_screen.png) | ![Home](screenshots/home_screen.png) | ![Add Task](screenshots/add_task_screen.png) |

- **Create Profile** — first-run screen to enter your name before landing on the dashboard.
- **Home / Dashboard** — greeting, a Tasks/Done/Pending summary card, and today's task list with colored status badges.
- **Add Task** — form to name a task, add a description, set its status, and pick a color tag.

## Features

- 🌍 **Localization** — English + Arabic out of the box, with automatic right-to-left layout for Arabic. No code generation required (`lib/l10n/app_localizations.dart`).
- 🎬 **Lottie splash screen** — an animated loader plays on launch before routing into the app (`lib/screens/splash_screen.dart`, `assets/lottie/splash_loading.json`).
- 📱 **Responsive layout** — padding, font sizes, and content width scale smoothly from small phones to tablets/desktop (`lib/utils/responsive.dart`).

## Getting started

```bash
flutter pub get
flutter run
```

Requires the Flutter SDK (stable channel, 3.19+ recommended) with a connected device, simulator, or emulator.

## Project structure

```
lib/
  main.dart                     # MaterialApp + localization delegates
  l10n/app_localizations.dart   # EN/AR strings + delegate
  theme/app_theme.dart          # Colors + ThemeData
  utils/responsive.dart         # Responsive helpers
  models/task_model.dart        # TaskItem + TaskStatus
  widgets/status_badge.dart     # Pending / Done / In Progress pill
  screens/
    splash_screen.dart          # Lottie splash
    create_profile_screen.dart  # Name entry
    home_screen.dart            # Task dashboard
    add_task_screen.dart        # New task form
assets/
  lottie/splash_loading.json    # Splash animation
screenshots/                    # App screenshots used in this README
```

## Try Arabic / RTL

In `lib/main.dart`, uncomment:

```dart
locale: const Locale('ar'),
```

to force Arabic and see the automatic right-to-left layout. Leave it
commented out to follow the device's system language (falls back to
English if unsupported).

## Navigation flow

```
Splash → Create Profile → Home ⇄ Add Task
```

Saving a task on the Add Task screen shows a confirmation snackbar and
returns to the Home dashboard.
