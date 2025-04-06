import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:polymita/Components/animated_button.dart';
import 'package:polymita/Core/app_model.dart';
import 'package:url_launcher/url_launcher.dart';

class _UX {
  static const screenWidthLimit = 1280.0;
  static const logoWidth = screenWidthLimit / 6.0;
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
    const String htmlContent = """
    <body>
    Polymita.it è il primo inclusion point digitale su Instagram.
    Un Inclusion Point è un <strong>punto di raccolta informazioni su tematiche che riguardano la nostra società</strong> e ha come obiettivo quello di <strong>contrastare la discriminazione con l’informazione.</strong><br><br>
    Il nostro team, composto da 5 collaboratrici, <strong>semplifica fonti autorevoli adattandole al nuovo stile comunicativo della nostra epoca.</strong><br><br>
    Pubblichiamo ogni settimana <strong>3 post su un tema scelto in base alle giornate internazionali del <a href="https://unric.org/it/calendario-giornate-internazionali/">calendario delle Nazioni Unite</a></strong>: una definizione, un approfondimento e un consiglio per saperne di più. Solo grazie alla cultura e allo sviluppo di un pensiero critico è possibile essere cittadini consapevoli e attivi, ecco perché con il nostro metodo, proponiamo un vero e proprio percorso di conoscenza delle tematiche.<br><br>
    <strong>Polymita é il nome della lumaca più preziosa del mondo!</strong> Conosciuta anche come
    "lumaca cubana dipinta", la Polymita Picta è nota per il suo guscio arcobaleno. ​​🐌​🌈​​<br>
    <div class="logo-wrapper">
    <img src="asset:assets/picta-logo.jpeg" class="picta-logo"/>
    </div>
    <strong>Come la lumaca prosegue lenta ma decisa verso il suo obiettivo lasciando una scia, anche la più piccola azione può fare la differenza e lasciare il segno.</strong><br><br>
    Vogliamo garantirti <strong>un punto di vista neutro</strong>, ecco perché tutti i nostri contenuti fanno riferimento a fonti autorevoli regolarmente citate,
    i cui link sono disponibili nel nostro 
    <strong>
        <a href="https://docs.google.com/spreadsheets/d/1e5yp9dR_NFugXrg2LWB6xgDpDpho7gUdYAaf6EQbPC0/edit?usp=sharing">archivio online condiviso</a>
    </strong><br><br>
    Per una preview del primo inclusion point digitale su Instagram👇​
</body>
    """;
    final style = {
      "body": Style(
        fontFamily: 'AppFont',
        margin: Margins.symmetric(horizontal: 20.0, vertical: 30.0),
        textAlign: TextAlign.center,
        color: model.theme.textTheme.displayLarge?.color,
        fontSize: FontSize(17.0),
      ),
      "div.logo-wrapper": Style(
        display: Display.block,
        textAlign: TextAlign.center,
      ),
      "div.facciamo-rete": Style.fromTextStyle(model.theme.textTheme.bodyLarge!
          .copyWith(color: model.theme.primaryColor)),
      "img.picta-logo": Style(
        width: Width(250),
        alignment: Alignment.center,
      ),
      "strong": Style(
        fontWeight: FontWeight.bold,
      ),
    };
    return SizedBox(
      width: _UX.screenWidthLimit,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: _UX.logoWidth, child: Image.asset("assets/logo-text.png")),
          Html(
              data: htmlContent,
              onAnchorTap: (url, attributes, element) {
                if (url != null) {
                  launchUrl(Uri.parse(url));
                }
              },
              style: style),
          AnimatedTextButton("CI TROVI QUI ➤", onPressed: () {
            launchUrl(Uri.parse(
                "https://www.instagram.com/polymita.it?igsh=d3JhcG9yODM1Z3Az&utm_source=qr"));
          }),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            color: model.theme.textTheme.displayLarge?.color,
            height: 2.0,
          ),
          Html(data: """
          <div style="text-align: center;" class="facciamo-rete">
          #facciamorete
          </div>
          Con Polymita vogliamo portare un cambiamento sociale positivo nel nostro paese. Se anche tu credi nella possibilità di una società più equa per tutt3 e ti va di aiutarci 👇​      
          """, style: style),
          AnimatedTextButton("SOSTIENI IL PROGETTO ➤", onPressed: () {
            launchUrl(Uri.parse(
                "https://www.instagram.com/polymita.it?igsh=d3JhcG9yODM1Z3Az&utm_source=qr"));
          }),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
