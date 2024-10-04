import 'package:flutter/material.dart';

class AppModel {
  final ThemeData theme;
  final String title;
  final String? description;
  final List<ButtonBarModel> navigationButtons;

  AppModel(Map<String, dynamic> json)
      : title = json["appTitle"],
        description = json["appDescription"],
        theme = _initTheme(json["theme"]),
        navigationButtons = _initButtonBarModels(json["navigationButtons"]);

  static ThemeData _initTheme(Map<String, dynamic> json) {
    // Extract theme mode (dark/light) from JSON
    final brightness =
        json["mode"] == "dark" ? Brightness.dark : Brightness.light;

    return ThemeData(
      brightness: brightness,
      primaryColor: Color(json["primaryColor"]),
      hintColor: Color(json["accentColor"]),

      // Text styles for various elements
      textTheme: TextTheme(
        displayLarge: _initTextStyle(json["textStyles"]["titleStyle"]),
        bodyLarge: _initTextStyle(json["textStyles"]["bodyStyle"]),
        labelLarge: _initTextStyle(json["textStyles"]["buttonStyle"]),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(json["buttonTheme"]["textColor"]),
          backgroundColor: Color(json["buttonTheme"]["backgroundColor"]),
        ),
      ),
    );
  }

  static TextStyle _initTextStyle(Map<String, dynamic> json) {
    return TextStyle(
      fontFamily: "AppFont",
      fontSize: json["fontSize"]?.toDouble(),
      color: Color(json["fontColor"]),
      shadows: json["shadows"] != null
          ? (json["shadows"] as List<dynamic>).map((shadowJson) {
              return Shadow(
                color: Color(shadowJson["color"]),
                blurRadius: shadowJson["blurRadius"].toDouble(),
              );
            }).toList()
          : null,
    );
  }

  static List<ButtonBarModel> _initButtonBarModels(List<dynamic> json) {
    return json.whereType<Map<String, dynamic>>().map((value) {
      return ButtonBarModel(value);
    }).toList();
  }
}

class ButtonBarModel {
  final String iconAsset;
  final String link;

  ButtonBarModel(Map<String, dynamic> json)
      : iconAsset = json["iconPath"],
        link = json["destinationLink"];
}
