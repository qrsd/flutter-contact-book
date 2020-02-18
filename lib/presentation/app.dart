import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upwork_tyler/presentation/user_page.dart';

import './home_page.dart';
import './login_page.dart';
import './existing_page.dart';
import './constants.dart';

/// Presets and routes
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      // ignore: missing_return
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => HomePage(), settings: settings);
          case '/login':
            return CupertinoPageRoute(
                builder: (_) => LoginPage(), settings: settings);
          case '/existing':
            return CupertinoPageRoute(
                builder: (_) => ExistingPage(), settings: settings);
          case '/user':
            return CupertinoPageRoute(
                builder: (_) => UserPage(), settings: settings);
        }
      },
    );
  }
}
