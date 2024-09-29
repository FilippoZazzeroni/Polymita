import 'package:flutter/material.dart';
import 'package:meme_sites/Components/animated_button.dart';

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
