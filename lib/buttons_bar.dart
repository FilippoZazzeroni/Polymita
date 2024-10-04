import 'package:flutter/material.dart';
import 'package:meme_sites/Components/animated_button.dart';
import 'package:meme_sites/Core/app_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonsBar extends StatelessWidget {
  final List<ButtonBarModel> buttonsModel;
  const ButtonsBar({super.key, required this.buttonsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          children: buttonsModel
              .map((value) => Row(
                    children: [
                      AnimatedIconButton(
                          Image.asset("assets/${value.iconAsset}"),
                          tinted: value.tinted, onPressed: () async {
                        launchUrl(Uri.tryParse(value.link) ?? Uri(),
                            webOnlyWindowName: "_blank");
                      }),
                      const SizedBox(
                        width: 20.0,
                      )
                    ],
                  ))
              .toList()),
    );
  }
}
