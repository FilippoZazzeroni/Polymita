import 'package:flutter/material.dart';
import 'package:polymita/Components/animated_button.dart';
import 'package:polymita/Core/app_model.dart';
import 'package:url_launcher/url_launcher.dart';

class _UX {
  static const screenWidthLimit = 1280.0;
  static const logoWidth = screenWidthLimit / 4.0;
  static const logoPadding = 50.0;
  static const callToActionPadding = 50.0;
  static const cardHeight = 400.0;
  static const cardWidth = screenWidthLimit / 2.0;
}

class ExtendedLayout extends StatelessWidget {
  final AppModel model;
  const ExtendedLayout({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: _UX.screenWidthLimit,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(_UX.logoPadding),
            child: Text(
              "Work in progress ...",
              style: model.theme.textTheme.displayLarge,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(_UX.callToActionPadding),
              child: AnimatedTextButton(
                "CI TROVI QUI >",
                onPressed: () {
                  launchUrl(Uri.tryParse(
                          "https://www.instagram.com/polymita.it?igsh=d3JhcG9yODM1Z3Az&utm_source=qr") ??
                      Uri());
                },
              )),

          // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   Flexible(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           model.description,
          //           textAlign: TextAlign.center,
          //           style: Theme.of(context).textTheme.labelLarge,
          //         ),
          //       ],
          //     ),
          //   )
          // ]),
          // Row(
          //   children: [
          //     Container(
          //       color: model.theme.scaffoldBackgroundColor,
          //       width: _UX.screenWidthLimit / 2.0,
          //       height: _UX.cardHeight,
          //       child: Padding(
          //         padding: const EdgeInsets.all(_UX.logoPadding),
          //         child: SizedBox(
          //             width: _UX.logoWidth, child: Image.asset("icon1.png")),
          //       ),
          //     ),
          //     Flexible(
          //         child: Container(
          //       height: _UX.cardHeight,
          //       color: model.theme.primaryColor,
          //       child: Text(
          //         "Semplifichiamo fonti autorevoli per renderle accessibili. Facciamo ordine in un mare di informazioni per diffondere cultura.",
          //         style: model.theme.textTheme.bodyLarge,
          //         textAlign: TextAlign.left,
          //       ),
          //     ))
          //   ],
          // ),
          // Row(
          //   children: [
          //     Flexible(
          //         child: Container(
          //       height: _UX.cardHeight,
          //       color: model.theme.primaryColor,
          //       child: Text(
          //         "Semplifichiamo fonti autorevoli per renderle accessibili. Facciamo ordine in un mare di informazioni per diffondere cultura.",
          //         style: model.theme.textTheme.bodyLarge,
          //         textAlign: TextAlign.left,
          //       ),
          //     )),
          //     Container(
          //       color: model.theme.scaffoldBackgroundColor,
          //       height: _UX.cardHeight,
          //       width: _UX.cardWidth,
          //       child: Image.asset(
          //         "picta.jpg",
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
