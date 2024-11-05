// Contenu de la page de navigation pour les écrans mobiles ,
// en principe le contenu de l'ecran doit etre variable ,
// et n'avoir en temps normal qu'un scaffold d'apres moi
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileMenu extends StatefulWidget {
  Widget menuContent;

  MobileMenu({required this.menuContent});

  @override
  State<MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<MobileMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu mobile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.menuContent,
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.pop("Valeur de retour mobile");
              },
              child: const Text("Fermer"),
            ),
          ],
        ),
      ),
    );
  }
}
