import 'package:flutter/material.dart';
import 'package:flutter_responsive_test/routes.dart';
import 'package:flutter_responsive_test/utils_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application Web Flutter"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String? value = await UtilsHelper.openMenu<String>(
              context,
              menuContent: menuContent(
                context: context,
              ),
            );
            print("##############################################");
            print("###RESULTAT DE NOTRE BOITE DE DIALOGUE : $value");
          },
          child: Text(
            "Afficher le Menu ${MediaQuery.of(context).size.width > 600 ? "Desktop" : "Mobile"}",
          ),
        ),
      ),
    );
  }
}

// Fonction de navigation adaptable

Widget menuContent({required BuildContext context}) {
  return Column(
    children: [
      //
      Text(
        "${MediaQuery.of(context).size.width > 600 ? "Hello nous somme dans le context d'ecran deskop" : "Hello nous somme dans le context de d'ecran Mobile"}.",
      ),
      //
    ],
  );
}
