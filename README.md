# Flutter
This repository contains two Flutter projects:

1)Navigation and Interaction App:
This Flutter application demonstrates the use of various widgets and navigation patterns, including a curved navigation bar, custom SliverAppBar, and interactive components like buttons, text fields, and counters.

  Features:

1.Curved Navigation Bar:
- provides smooth navigation between three different pages;
- icons dynamically update the displayed content.

2.SliverAppBar:
- a large, customizable app bar with menu options and actions;
- popup menus for quick actions like settings, help, and logout.

3.Dynamic Pages:
- Page 1: Displays a customizable "Like" button.
- Page 2: Features a text input field with real-time text display.
- Page 3: Includes a counter that increments with a button press.

  Code Structure:
- main(): Entry point of the app;
- MyHomePage: Root widget containing the navigation bar and SliverAppBar;
- Home: Displays content dynamically based on the selected navigation item;
- CounterWidget: Displays a counter with increment functionality;
- TextFieldWidget: A text input field with real-time display;
- LikeButtonWidget: Displays an animated like button.

  Dependencies:
- flutter/material.dart: Core Flutter package for UI development;
- curved_navigation_bar: Provides the curved navigation bar;
- like_button: Offers the animated like button.

  To add these dependencies to your project, include them in your pubspec.yaml file

2)Calculator App:
This Flutter application provides a simple yet powerful calculator with support for basic arithmetic operations, advanced mathematical functions, and a dynamic user interface.

Features:
- Basic Arithmetic Operations;
- Advanced Mathematical Functions;
- Interactive Buttons;
- Dynamic Input Display : Real-time display of entered numbers, operations, and results;
- Responsive Design : Buttons dynamically adjust to screen size for better usability.

  Code Structure:
- CalculatorScreen : The main widget that renders the calculator interface, includes a display area for input/output and a button grid for operations.
- Button Handling : Buttons are mapped using the buttonValues array from the button_values.dart file, each button triggers a specific action (e.g., append value, calculate, clear).
- Calculation Logic : Handled in methods like calculate(), convertToPercentage(), clearAll(), and delete(), supports chaining operations and immediate calculation of advanced functions.
- Dynamic Styling : Button colors are determined by their function using the getBtnColor() method.

  Dependencies:
- flutter/material.dart: Core Flutter package for building UI components;
- dart:math: Provides mathematical functions like log and sqrt.

  Set-Up Instructions
- ensure Flutter is installed and configured on your system;
- clone this repository to your local machine;
- navigate to the project directory;
- run the following command : flutter run
