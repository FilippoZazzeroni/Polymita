import 'package:flutter/material.dart';
import 'package:meme_sites/Components/animated_button.dart';
import 'package:meme_sites/theme.dart';

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
      theme: theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff2E2E3A), // Lighter dark grayish-blue at the top
                Color(0xff1E1E2E), // The base color
                // Transparent to blend with the logo
              ],
            ),
          ),
          child: ListView(
            children: [
              const ButtonsBar(),
              const SizedBox(height: 50.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Shibalorian the return",
                    style: Theme.of(context).textTheme.displayLarge),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset("logo.png", fit: BoxFit.cover),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Flexible(
                      child: Text(
                        "Find out the power of the shibalorian, the force might resides in you",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                  AnimatedTextButton("GET IT")
                ],
              )
            ],
          )),
    );
  }
}

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          AnimatedIconButton(Icons.telegram),
          const SizedBox(width: 12.0),
          AnimatedIconButton(Icons.one_x_mobiledata)
        ],
      ),
    );
  }
}
