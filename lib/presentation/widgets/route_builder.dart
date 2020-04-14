import 'package:flutter/material.dart';

/// Custom Page builder used for the drawer.
Route fullRouteBuilder(
    BuildContext context, Widget page, Offset begin, Offset end) {
  return PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
