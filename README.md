# KidsLearn

## Business Overview

### Project Description
KidsLearn is an interactive educational mobile application designed to help children learn numbers in a fun and engaging way. The app features a simple, child-friendly interface with colorful visuals and clear text to make learning enjoyable.

### Key Features
- **Learn Numbers:** Interactive number cards from 1 to 10.
- **Visual Aids:** Each number is associated with a distinct color and its English word representation to reinforce learning.
- **Clean Interface:** Designed specifically for young children with easy navigation and large, readable text.

### Target Audience
- Preschool and kindergarten children (ages 3-6).
- Parents looking for simple educational tools for their children.

---

## Development Overview

### Tech Stack
- **Framework:** Flutter
- **Language:** Dart
- **State Management:** [Riverpod](https://riverpod.dev/) (utilizing `riverpod_annotation` and `riverpod_generator`)

### Architecture
The project follows a **Feature-first** architecture, organizing code by features rather than layers. This structure improves modularity and scalability.

#### Project Structure
- `lib/src/features`: Contains feature-specific logic.
  - **home**: The main entry point and navigation.
  - **numbers**: The core feature for learning numbers.
    - `data`: Data providers (e.g., `NumberRepository`) and Riverpod providers.
    - `domain`: Data models (e.g., `NumberModel`) and business entities.
    - `presentation`: UI widgets and screens (e.g., `NumberScreen`).
- `lib/src/common_widgets`: Reusable UI components used across multiple features.
- `lib/src/constants`: App-wide constants such as themes and styles.

### Setup & Installation

#### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- A physical device or emulator/simulator.

#### Steps
1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd kids_learn
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run Code Generation:**
    Since the project uses `riverpod_generator`, you need to run the build runner to generate the provider code.
    ```bash
    dart run build_runner build -d
    ```
    To automatically rebuild when files change, use:
    ```bash
    dart run build_runner watch -d
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```

### Testing
To run the tests, use the following command:
```bash
flutter test
```
