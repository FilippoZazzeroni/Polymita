import 'package:flutter/material.dart';
import 'package:meme_sites/home_page.dart';
import 'package:meme_sites/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeBuilder.from(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const HomePage(),
    );
  }
}
