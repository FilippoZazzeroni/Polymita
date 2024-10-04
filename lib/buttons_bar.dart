import 'package:flutter/material.dart';
import 'package:meme_sites/Components/animated_button.dart';
import 'package:meme_sites/Core/app_model.dart';

class ButtonsBar extends StatelessWidget {
  final List<ButtonBarModel> buttonsModel;
  const ButtonsBar({super.key, required this.buttonsModel});

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
