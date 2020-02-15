import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './home_page.dart';

/// Presets
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: themeData,
      home: HomePage(),
    );
  }
}
