import 'package:flutter/material.dart';
import 'package:meme_sites/Core/app_model.dart';
import 'package:meme_sites/Core/model_builder.dart';
import 'package:meme_sites/home_page.dart';
import 'package:meme_sites/theme.dart';

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
      title: 'Flutter Demo',
      theme: ThemeBuilder.from(model.theme, context),
      home: HomePage(
        model: model,
      ),
    );
  }
}
