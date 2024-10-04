import 'package:flutter/material.dart';

class ThemeBuilder {
  static ThemeData from(ThemeData modelTheme, BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    var fontReducer = 1.0;
    if (screenSize.width < 750) {
      fontReducer = 0.5;
    }
    return ThemeData(
        // Define the default brightness and background color.
        brightness: modelTheme
            .brightness, // or Brightness.light depending on your preference
        primaryColor: modelTheme.primaryColor, // Primary color
        hintColor: modelTheme.hintColor, // Accent color

        // Define default text color and style for various widgets
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: "AppFont",
            fontSize: 100 * fontReducer,
            fontWeight: FontWeight.bold,
            color: modelTheme.textTheme.displayLarge?.color,
            shadows: [
              // Central strong blue glow
              Shadow(
                offset: const Offset(0, 0),
                blurRadius: 10, // Smaller radius for a sharp, strong inner glow
                color: const Color(0xff00CFFF).withOpacity(1.0),
              ),
              // Mid-level glow for a broader cyan effect
              Shadow(
                offset: const Offset(0, 0),
                blurRadius: 20, // Mid-level glow for a broader glow
                color: const Color(0xff00BFFF).withOpacity(0.9),
              ),
              // Outer glow, more diffuse for the saber's full effect
              const Shadow(
                offset: Offset(0, 0),
                blurRadius: 40,
                color: Color.fromRGBO(0, 75, 160, 0.7),
              ),
              Shadow(
                offset: const Offset(0, 0),
                blurRadius: 60, // Larger blur for even more outer glow
                color: const Color(0xff00CFFF).withOpacity(0.5),
              ),
            ],
          ),
          bodyLarge: TextStyle(
            fontFamily: 'AppFont', // Gamified font for body text
            color: modelTheme.textTheme.bodyLarge?.color,
            fontSize: 16,
          ),
          labelLarge: TextStyle(
            fontFamily: 'AppFont',
            fontSize: 40 * fontReducer,
            color: modelTheme.textTheme.labelLarge?.color,
          ),
        ),
        elevatedButtonTheme: modelTheme.elevatedButtonTheme);
  }
}
