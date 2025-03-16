import 'package:flutter/material.dart';

class ThemeBuilder {
  static ThemeData from(ThemeData modelTheme, BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    var fontReducer = 1.0;
    if (screenSize.width < 750) {
      fontReducer = 0.5;
    }

    return modelTheme;
  }
}
