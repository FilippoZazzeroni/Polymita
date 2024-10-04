import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:meme_sites/Core/app_model.dart';

class ModelBuilder {
  static Future<AppModel> load() async {
    final jsonString = await rootBundle.loadString("assets/app.example.json");
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return AppModel(json);
  }
}
