import 'package:flutter/material.dart';
import 'package:meme_sites/Components/animated_button.dart';
import 'package:meme_sites/Core/app_model.dart';

class _UX {
  static const logoBottomPadding = 40.0;
}

class CompactLayout extends StatelessWidget {
  final AppModel model;
  const CompactLayout({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Shibalorian the return",
              style: Theme.of(context).textTheme.displayLarge),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: _UX.logoBottomPadding),
          child: SizedBox(
              height: screenSize.width / 1.4,
              child: Image.asset("logo.png", fit: BoxFit.cover)),
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
            AnimatedTextButton(
              "GET IT",
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
