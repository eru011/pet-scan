# WellFur - Flutter Frontend

## Overview
WellFur is in its early stages of development and is not yet complete. This version focuses on building a user-friendly Flutter frontend for pet skin disease detection.
WellFur is in its early stages of development, focusing on building a user-friendly Flutter frontend for pet skin disease detection.
WellFur is a mobile application designed to provide a user-friendly interface for detecting pet skin diseases. This version includes only the frontend, developed using Flutter, allowing users to capture or upload pet images for analysis. The app is designed for smooth navigation and can be integrated with a backend model for disease detection.

## Features
- **User-Friendly Interface**: Intuitive and easy-to-use UI built with Flutter.
- **Image Capture & Upload**: Allows users to take photos or select images from their gallery.
- **Smooth Navigation**: Well-structured screens for a seamless user experience.
- **Offline Support**: Basic functionalities work without an internet connection.

## Technology Stack
- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Provider / Riverpod (if used)
- **UI Components**: Material Design / Custom Widgets

## Installation
### Prerequisites
- Flutter SDK installed
- Android Studio or Visual Studio Code with Flutter plugin

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/wellfur-frontend.git
   cd wellfur-frontend
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on an emulator or device:
   ```bash
   flutter run
   ```

## Folder Structure
```
wellfur-frontend/
│── lib/
│   ├── main.dart  # Entry point of the app
│   ├── screens/   # UI screens
│   ├── widgets/   # Reusable UI components
│   ├── providers/ # State management (if used)
│── assets/        # Images and resources
│── pubspec.yaml   # Dependencies and project metadata
```

## Future Improvements
- **Backend Integration**: Connect with the detection model API.
- **Dark Mode Support**: Enhance UI accessibility.
- **Multi-Language Support**: Localization for wider reach.

Thank you for using WellFur! 🐶🐱

