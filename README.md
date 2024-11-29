# Task Management App Documentation

## Overview

The **Task Management App** is a Flutter-based application that integrates with **Back4App** (a Parse server platform) for backend functionalities. It includes user authentication (sign-up, login, and logout) and a task management page to manage user tasks. This documentation provides step-by-step instructions for setting up the app, along with an overview of its components.

---

## Features

- **User Authentication**: Login and Sign-Up functionality using Back4App.
- **Task Management**: Users can access their tasks after logging in.
- **Responsive UI**: Built with Flutter for smooth cross-platform performance.
- **Data Storage**: Back4App stores user data and task-related information.

---

## Setup Instructions

### 1. **Create a Back4App Account**
- Go to [Back4App](https://www.back4app.com/) and create an account.
- Create a new application on the Back4App dashboard.

### 2. **Set Up the Parse Server**
- After creating your application, navigate to the **Dashboard** → **App Settings** → **Server Settings**.
- Note down the following credentials:
  - `Application ID`
  - `Client Key`
  - `Server URL` (usually `https://parseapi.back4app.com`)

### 3. **Initialize Parse in Flutter**
- Open your Flutter project.
- Add the `parse_server_sdk_flutter` dependency in `pubspec.yaml`:
  ```yaml
  dependencies:
    flutter:
      sdk: flutter
    parse_server_sdk_flutter: ^5.0.0
  ```
- Run `flutter pub get` to install the dependency.
- In `main.dart`, initialize the Parse server with your Back4App credentials:
  ```dart
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    const keyApplicationId = 'YOUR_APP_ID_HERE';
    const keyClientKey = 'YOUR_CLIENT_KEY_HERE';
    const keyParseServerUrl = 'https://parseapi.back4app.com';

    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      debug: true,
    );

    runApp(const MyApp());
  }
  ```

---

## App Components

### 1. **Main App (`main.dart`)**
- Entry point of the application.
- Initializes the Parse server and sets the home page of the app.
- Routes:
  - `/`: Login Page
  - `/signup`: Sign-Up Page
  - `/tasks`: Task Management Page

---

### 2. **Login Page (`login.dart`)**
#### Purpose:
Allows users to log in with their credentials or navigate to the Sign-Up page.

#### Key Features:
- Username and password input fields.
- Login button to authenticate the user via Back4App.
- "Sign Up" button to navigate to the Sign-Up page.

#### Code Snippet:
```dart
TextButton(
  onPressed: () {
    Navigator.pushNamed(context, '/signup');
  },
  child: const Text('Don\'t have an account? Sign Up'),
);
```

#### Backend Integration:
- Validates the username and password against Back4App.
- On successful login, navigates the user to the `tasks.dart` page.

---

### 3. **Sign-Up Page (`signup.dart`)**
#### Purpose:
Allows new users to register an account.

#### Key Features:
- Username, email, and password input fields.
- Sign-Up button to register the user on Back4App.
- Link to the Login page for existing users.

#### Code Snippet:
```dart
TextButton(
  onPressed: () {
    Navigator.pushNamed(context, '/');
  },
  child: const Text('Already have an account? Login'),
);
```

#### Backend Integration:
- Creates a new user in the Back4App database using the `ParseUser` class.

---

### 4. **Task Management Page (`tasks.dart`)**
#### Purpose:
Displays and manages user tasks.

#### Key Features:
- Task list for the logged-in user.
- Add, update, and delete tasks (future scope).

#### Backend Integration:
- Fetches user-specific task data from Back4App.
- (Future Scope): Synchronizes task changes with the backend.

---

### 5. **Routing**
The app uses Flutter's named routing for easy navigation between pages:
- **`/`**: Login Page
- **`/signup`**: Sign-Up Page
- **`/tasks`**: Task Management Page

Add the following in `MaterialApp`:
```dart
MaterialApp(
  routes: {
    '/': (context) => const LoginPage(),
    '/signup': (context) => const SignupPage(),
    '/tasks': (context) => const TasksPage(),
  },
);
```

---

## Folder Structure

```
lib/
├── main.dart         // Entry point, initializes Parse and routes
├── login.dart        // Login Page
├── signup.dart       // Sign-Up Page
├── tasks.dart        // Task Management Page
```

---

## Future Improvements
- **Task CRUD Functionality**: Add Create, Read, Update, and Delete operations for tasks.
- **Error Handling**: Improve error messages for better user feedback.
- **UI Enhancements**: Use custom themes and animations for a polished look.

---

## Conclusion

This Task Management App demonstrates a simple integration of Flutter with Back4App, showcasing user authentication and navigation. Follow the instructions to set up and customize the app as per your requirements. For further support, refer to the [Back4App Documentation](https://www.back4app.com/docs/).
