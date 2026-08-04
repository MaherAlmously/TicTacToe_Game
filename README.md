# Tic Tac Toe

A simple two-player Tic Tac Toe game built with Flutter. Runs on Android, iOS, web, Windows, macOS, and Linux from one codebase.

## What it does

- Two-player local play, X and O take turns on the same device.
- Win/draw detection with a result screen after each game.
- Sound effect on a win.
- Start screen to kick off a new match.

## Stack

- Flutter, Dart
- google_fonts for custom text styling
- audioplayers for the win sound

## Running it locally

```
flutter pub get
flutter run
```

Pick a device/emulator when prompted, or run `flutter run -d chrome` for the web build.

## Project layout

- `lib/main.dart` - app entry point
- `lib/tictactoe.dart` - root widget, wires the screens together
- `lib/start_screen.dart` - start/menu screen
- `lib/game.dart` - the game board and turn logic
- `lib/players.dart` - player state (X/O)
- `lib/result_screen.dart` - win/draw screen
- `assets/sounds/` - win sound effect
