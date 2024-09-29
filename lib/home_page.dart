import 'package:flutter/material.dart';
import 'package:meme_sites/Layouts/compact_layout.dart';
import 'package:meme_sites/Layouts/extended_layout.dart';
import 'package:meme_sites/buttons_bar.dart';

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
              LayoutBuilder(builder: (context, constraint) {
                final List<Widget> chidren = [];
                if (constraint.maxWidth < 1500) {
                  chidren.add(const CompactLayout());
                } else {
                  chidren.add(const ExtendedLayout());
                }
                return Column(children: chidren);
              })
            ],
          )),
    );
  }
}
