import 'package:flutter/material.dart';
import 'package:polymita/Core/app_model.dart';
import 'package:polymita/Core/model_builder.dart';
import 'package:polymita/home_page.dart';
import 'package:polymita/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appModel = await ModelBuilder.load();
  runApp(MyApp(model: appModel));
}

class MyApp extends StatelessWidget {
  final AppModel model;
  const MyApp({super.key, required this.model});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: model.title,
      theme: ThemeBuilder.from(model.theme, context),
      home: HomePage(
        model: model,
      ),
    );
  }
}
