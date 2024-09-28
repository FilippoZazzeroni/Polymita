import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(100, 50, 120, 1),
              Color.fromRGBO(54, 27, 50, 1), // The base color
              // Transparent to blend with the logo
            ],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("logo.png", fit: BoxFit.cover),
            ),
          ],
        ));
  }
}
