// Contenu de la page de navigation pour les écrans desktop ,
// ici comme dans Businness , le menu est cense s'afficher a
//l'extreme droite et la sortie se fait lors du clique dans l'espace gauche
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebMenu extends StatefulWidget {
  final Widget menuContent;
  const WebMenu({
    super.key,
    required this.menuContent,
  });
  @override
  State<WebMenu> createState() => _WebMenuState();
}

class _WebMenuState extends State<WebMenu> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(.001),
      body: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.pop("Valeur de retour desktop");
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
          ),
          Container(
            width: media.width > 600 ? 600 : media.width,
            height: media.height,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              color: Colors.yellow,
            ),
            child: widget.menuContent,
          ),
        ],
      ),
    );
  }
}
