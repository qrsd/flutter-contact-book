import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../data/api/api.dart';
import '../data/api/link_repository_impl.dart';
import '../domain/blocs/links/bloc.dart';
import './activity_page.dart';
import './add_page.dart';
import './constants.dart';
import './links_page.dart';
import './login_page.dart';
import './registration_page.dart';
import './user_page.dart';

/// Presets and routes
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return BlocProvider<LinksBloc>(
      create: (context) => LinksBloc(
        linkRepositoryImpl: LinkRepositoryImpl(
          apiClient: ApiClient(
            httpClient: http.Client(),
          ),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: '/login',
        // ignore: missing_return
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/activity':
              return CupertinoPageRoute(
                  builder: (_) => ActivityPage(), settings: settings);
            case '/add':
              return CupertinoPageRoute(
                  builder: (_) => AddPage(), settings: settings);
            case '/links':
              return CupertinoPageRoute(
                  builder: (_) => LinksPage(), settings: settings);
            case '/login':
              return CupertinoPageRoute(
                  builder: (_) => LoginPage(), settings: settings);
            case '/registration':
              return CupertinoPageRoute(
                  builder: (_) => RegistrationPage(), settings: settings);
            case '/user':
              return CupertinoPageRoute(
                  builder: (_) => UserPage(), settings: settings);
          }
        },
      ),
    );
  }
}
