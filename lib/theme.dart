import 'package:flutter/material.dart';

final theme = ThemeData(
  // Define the default brightness and background color.
  brightness:
      Brightness.dark, // or Brightness.light depending on your preference
  primaryColor: Color(0xff00CFFF), // Primary color
  hintColor: Color(0xff00BFFF), // Accent color

  // Define default text color and style for various widgets
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: "LuckiestGuy",
      fontSize: 100,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        // Central strong blue glow
        Shadow(
          offset: Offset(0, 0),
          blurRadius: 10, // Smaller radius for a sharp, strong inner glow
          color: Color(0xff00CFFF)
              .withOpacity(1.0), // Strong cyan blue glow close to text
        ),
        // Mid-level glow for a broader cyan effect
        Shadow(
          offset: Offset(0, 0),
          blurRadius: 20, // Mid-level glow for a broader glow
          color:
              Color(0xff00BFFF).withOpacity(0.9), // Cyan glow expanding outward
        ),
        // Outer glow, more diffuse for the saber's full effect
        Shadow(
          offset: Offset(0, 0),
          blurRadius: 40, // Large blur for outer glow
          color: Color.fromRGBO(
              0, 75, 160, 0.7), // Deep blue glow for farthest light
        ),
        // Extra outer glow for even more saber-like effect
        Shadow(
          offset: Offset(0, 0),
          blurRadius: 60, // Larger blur for even more outer glow
          color: Color(0xff00CFFF)
              .withOpacity(0.5), // Additional cyan blue far glow
        ),
      ],
    ),
    bodyLarge: const TextStyle(
      fontFamily: 'LuckiestGuy', // Gamified font for body text
      color: Colors.white,
      fontSize: 16,
    ),
    labelLarge: const TextStyle(
      fontFamily: 'LuckiestGuy',
      fontSize: 40,
      color: Colors.white,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // Button text color
      backgroundColor: Color(0xff00BFFF), // Button background color
    ),
  ),
);
