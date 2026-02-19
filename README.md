# KidsLearn

[🇹🇷 Türkçe Oku (Read in Turkish)](README_TR.md)

Welcome to the **KidsLearn** repository! This is an interactive educational application designed to help young children learn basic concepts through engaging visuals and audio feedback.

---

## 📚 Business Overview

### Project Description
KidsLearn is a mobile application built with Flutter, aimed at making learning fun and accessible for preschoolers and early elementary school children. The app focuses on interactive learning experiences, starting with number recognition and pronunciation.

### Key Features
*   **Learn Numbers:** A dedicated module for learning numbers.
*   **Audio Pronunciation:** Tap on any number to hear its pronunciation, reinforcing auditory learning.
*   **Visual Association:** Each number is accompanied by colorful visuals and word representations (e.g., "One", "Two").
*   **Interactive Interface:** Designed with large buttons and vibrant colors suitable for kids.

### Target Audience
*   Preschoolers (ages 3-5)
*   Early Elementary Students (ages 6-7)
*   Parents and Educators looking for educational tools.

---

## 🛠️ Development Guide

### Tech Stack
*   **Framework:** [Flutter](https://flutter.dev/) (Dart)
*   **State Management:** [Riverpod](https://riverpod.dev/) (`flutter_riverpod`, `riverpod_annotation`)
*   **Audio:** [AudioPlayers](https://pub.dev/packages/audioplayers)
*   **Code Generation:** `build_runner`, `riverpod_generator`

### Architecture
The project follows a **Feature-First Architecture** to ensure scalability and maintainability.

*   `lib/src/features/`: Contains feature-specific code (e.g., `numbers`, `home`).
    *   Each feature is further divided into `data`, `domain`, and `presentation` layers.
*   `lib/src/common_widgets/`: Reusable UI components.
*   `lib/src/constants/`: App-wide constants and theme configurations.

### Folder Structure
```
lib/
├── main.dart                # Application entry point
└── src/
    ├── common_widgets/      # Shared widgets (buttons, cards, etc.)
    ├── constants/           # Theme, colors, strings
    └── features/            # Feature modules
        ├── home/            # Home screen feature
        └── numbers/         # Learn Numbers feature
            ├── data/        # Data providers (Riverpod)
            ├── domain/      # Data models
            └── presentation/# UI screens and widgets
```

### Setup & Installation

1.  **Prerequisites:** Ensure you have the Flutter SDK installed.
2.  **Clone the Repository:**
    ```bash
    git clone <repository-url>
    cd kids_learn
    ```
3.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```

### Code Generation
This project uses `riverpod_generator` for state management providers. You must run the build runner to generate the necessary code (e.g., `.g.dart` files).

*   **One-time build:**
    ```bash
    dart run build_runner build
    ```
*   **Watch mode (for development):**
    ```bash
    dart run build_runner watch
    ```

### Assets
The application relies on local assets for images and audio. Ensure the following structure exists in your project root:
*   `assets/audio/numbers/` (e.g., `1.mp3`, `2.mp3`)
*   `assets/images/numbers/` (e.g., `1.png`, `2.png`)

### Running the App
Connect a device or start an emulator, then run:
```bash
flutter run
```
