import 'package:flutter/material.dart';
import 'package:meme_sites/Core/app_model.dart';
import 'package:meme_sites/Layouts/compact_layout.dart';
import 'package:meme_sites/Layouts/extended_layout.dart';
import 'package:meme_sites/buttons_bar.dart';

class HomePage extends StatelessWidget {
  final AppModel model;
  const HomePage({super.key, required this.model});

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
              ButtonsBar(buttonsModel: model.navigationButtons),
              LayoutBuilder(builder: (context, constraint) {
                final List<Widget> chidren = [];
                if (constraint.maxWidth < 1500) {
                  chidren.add(CompactLayout(model: model));
                } else {
                  chidren.add(ExtendedLayout(model: model));
                }
                return Column(children: chidren);
              })
            ],
          )),
    );
  }
}
