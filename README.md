[![Português](https://img.shields.io/badge/Language-Português-brightgreen.svg)](./README.pt.md)

# Flutter Animated Switcher Example

This project demonstrates the use of Flutter's `AnimatedSwitcher` widget to create a smooth transition from a splash screen to the home page of an application.

## Features

- Splash screen that displays while the application is loading.
- Animated transition from the splash screen to the home page.
- Home page that is displayed after the application has loaded.

## Customizations

You can customize the splash screen animation by modifying the `SplashApp` class.

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository: `git clone https://github.com/anzell/flutter_splash_animation_example.git`
2. Navigate into the project directory: `cd flutter_splash_animation_example`
3. Install the dependencies: `flutter pub get`
4. Run the application: `flutter run`

## Understanding the Code

The main part of this project is the `SplashApp` class, which is a `StatefulWidget`. In its state, an `AnimationController` and an `Animation` are created. The `AnimationController` controls the duration of the animation, and the `Animation` defines the animation's behavior.

The `initState` method of the state class starts the animation when the Future method containing application's dependencies have been done. The `build` method returns a `Stack` widget that contains a simple splash screen containing FlutterLogo, and the home page. The home page is wrapped in an `AnimatedBuilder` widget that uses the `Animation` to create a scale transition from the splash screen to the home page.
