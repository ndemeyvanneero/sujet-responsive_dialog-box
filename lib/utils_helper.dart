import 'package:flutter/material.dart';
import 'package:flutter_responsive_test/constant.dart';
import 'package:go_router/go_router.dart';

class UtilsHelper {
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
}
