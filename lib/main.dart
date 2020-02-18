import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './domain/blocs/simple_bloc_delegate.dart';
import './presentation/app.dart';

/// Run app and setup BLoC delegate
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}
