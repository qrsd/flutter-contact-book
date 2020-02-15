import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './presentation/app.dart';
import './domain/blocs/simple_bloc_delegate.dart';

/// Setup BLoC delagte
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

