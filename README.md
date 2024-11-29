# Task Master

[![MIT License](https://img.shields.io/github/license/your-username/task-master)](LICENSE)
[![Issues](https://img.shields.io/github/issues/your-username/task-master)](https://github.com/your-username/task-master/issues)
[![Forks](https://img.shields.io/github/forks/your-username/task-master)](https://github.com/your-username/task-master/network/members)
[![Stars](https://img.shields.io/github/stars/your-username/task-master)](https://github.com/your-username/task-master/stargazers)

## 📋 Table of Contents

- [About the Project](#about-the-project)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Features](#features)
- [Screenshots](#screenshots)
- [Folder Structure](#folder-structure)
- [Security Rules](#security-rules)
- [Authentication Methods](#authentication-methods)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## 📖 About the Project

**Task Master** is a Flutter-based todo app that helps users manage their daily tasks. It allows users to add, edit, delete, and mark tasks as completed. With light and dark mode theme options, as well as a settings page, Task Master provides an intuitive way to organize tasks.

### 🛠 Built With

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

## 🚀 Getting Started

Follow the instructions below to get your local copy running.

### ✅ Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio / Xcode for device emulation
- A mobile emulator or a physical device connected

### 🛠 Installation

1. **Clone the repo**:
   ```sh
   git clone https://github.com/alvinkatabarwa/task-master.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd task_master
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Set up Firebase:**

   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new project or use an existing one.
   - Add an Android/iOS app to your Firebase project.
   - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place it in the appropriate directory in your Flutter project.

5. **Run the app:**

   ```bash
   flutter run
   ```

## 🔒 Security Rules

To ensure data security and integrity, the following Firebase Firestore security rules are applied:
```bash
json
service cloud.firestore {
match /databases/{database}/documents {
match /tasks/{taskId} {
allow read, write: if request.auth != null;
}
}
}
```

These rules ensure that only authenticated users can read and write to the `tasks` collection.

## 🔑 Authentication Methods

The app uses Firebase Authentication with the following method:

- **Email and Password Authentication**: Users can sign up and log in using their email addresses and passwords.

## 📱 Usage

1. **Sign Up / Log In**: Users can create an account or log in using their email and password.
2. **Manage Tasks**: Once logged in, users can add, edit, delete, and mark tasks as completed.
3. **Settings**: Users can switch between light and dark mode themes.

## Contributors

- **Prisca Uwase**: Worked on the design and implementation of the first pages.
- **Alvin Katabarwa**: Worked on the front-end of the app and state management.
- **Rene Ntabana**: Worked on setting up the backend and its functionalities.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

- **Prisca Uwase**: [Email](mailto:prisca@example.com)
- **Alvin Katabarwa**: [Email](mailto:alvin@example.com)
- **Rene Ntabana**: [Email](mailto:rene@example.com)
