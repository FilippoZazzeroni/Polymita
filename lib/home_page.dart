import 'package:flutter/material.dart';
import 'package:polymita/Core/app_model.dart';
import 'package:polymita/Layouts/compact_layout.dart';
import 'package:polymita/Layouts/extended_layout.dart';
import 'package:polymita/buttons_bar.dart';

class HomePage extends StatelessWidget {
  final AppModel model;
  const HomePage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: model.theme.scaffoldBackgroundColor,
      body: ListView(
        children: [
          ButtonsBar(buttonsModel: model.navigationButtons),
          LayoutBuilder(builder: (context, constraint) {
            final List<Widget> chidren = [];
            chidren.add(ExtendedLayout(model: model));
            return Column(children: chidren);
          })
        ],
      ),
    );
  }
}
