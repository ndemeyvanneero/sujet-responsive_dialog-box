import 'package:flutter/material.dart';
import 'package:flutter_responsive_test/constant.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class UtilsHelper {
  /** HELLO MR NGOU,
   * Je vais du prinicpe que , un menu peux retourner une valeur ou pas , d'ou la generic 
   * dans ce cas pour la methode openMenu
   * */
  static Future<T?> openMenu<T>(
    BuildContext context, {
    required Widget menuContent,
  }) async {
    // Determine if the screen is desktop or mobile
    bool isDesktop = MediaQuery.of(context).size.width > 600;

    // Determine the route based on the screen size
    final String route = isDesktop ? webMenu : mobileMenu;

    // Use context.push to navigate and return the result
    final result = await context.push<T>(
      route,
      extra: menuContent,
    );

    // Print the returned value if it's not null
    if (result != null) {
      print("Valeur retournée : $result");
    }

    // Return the result, which is of type T?
    return result;
  }

  static log({
    dynamic message,
    dynamic error,
    StackTrace? trace,
    String? name,
  }) {
    getCurrentMethodName() {
      final frames = StackTrace.current.toString().split('\n');
      var currentFrame = frames.elementAtOrNull(2);
      if (currentFrame != null) {
        var methodName = currentFrame.split("/").lastOrNull;
        if (methodName != null) {
          return methodName.replaceAll(")", "");
        }
      }
    }
  }
}
