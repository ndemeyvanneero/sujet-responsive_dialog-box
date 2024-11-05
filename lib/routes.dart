// Configuration du routeur
import 'package:flutter/material.dart';
import 'package:flutter_responsive_test/constant.dart';
import 'package:flutter_responsive_test/main.dart';
import 'package:flutter_responsive_test/mobile_menu.dart';
import 'package:flutter_responsive_test/web_menu.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    // Cette route est reserver uniquement pour les menu et boite de dialog
    GoRoute(
      path: webMenu,
      pageBuilder: (context, state) {
        final Widget menuContent = state.extra as Widget;
        return CustomTransitionPage(
          child: WebMenu(menuContent: menuContent),
          opaque: false,
          barrierColor: Colors.black.withOpacity(.25),
          barrierDismissible:
              true, // Allow dismissing by tapping outside the dialog
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: mobileMenu,
      pageBuilder: (context, state) {
        final Widget menuContent = state.extra as Widget;
        return CustomTransitionPage(
          child: MobileMenu(menuContent: menuContent),
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ],
);