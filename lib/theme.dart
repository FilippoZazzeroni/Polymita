import 'package:flutter/material.dart';

class ThemeBuilder {
  static ThemeData from(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    var fontReducer = 1.0;
    if (screenSize.width < 750) {
      fontReducer = 0.5;
    }
    return ThemeData(
      // Define the default brightness and background color.
      brightness:
          Brightness.dark, // or Brightness.light depending on your preference
      primaryColor: const Color(0xff00CFFF), // Primary color
      hintColor: const Color(0xff00BFFF), // Accent color

      // Define default text color and style for various widgets
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: "LuckiestGuy",
          fontSize: 100 * fontReducer,
          fontWeight: FontWeight.bold,
          color: Colors.white,
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
        bodyLarge: const TextStyle(
          fontFamily: 'LuckiestGuy', // Gamified font for body text
          color: Colors.white,
          fontSize: 16,
        ),
        labelLarge: TextStyle(
          fontFamily: 'LuckiestGuy',
          fontSize: 40 * fontReducer,
          color: Colors.white,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Button text color
          backgroundColor: const Color(0xff00BFFF), // Button background color
        ),
      ),
    );
  }
}
