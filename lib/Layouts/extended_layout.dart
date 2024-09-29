import 'package:flutter/material.dart';
import 'package:meme_sites/Components/animated_button.dart';

class _UX {
  static const screenWidthLimit = 1920.0;
  static const logoWidth = screenWidthLimit / 2.7;
}

class ExtendedLayout extends StatelessWidget {
  const ExtendedLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: _UX.screenWidthLimit,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Shibalorian the return",
                style: Theme.of(context).textTheme.displayLarge),
          ),
          SizedBox(height: screenSize.height / 10.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                  width: _UX.logoWidth, child: Image.asset("logo.png")),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Find out the power of the shibalorian, the force might resides in you",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  AnimatedTextButton("GET IT")
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
