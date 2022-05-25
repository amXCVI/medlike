import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medlike/app.dart';
import 'package:medlike/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}
