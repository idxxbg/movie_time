import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void changeTheme(int i) async {
    switch (i) {
      case 0:
        emit(ThemeMode.system);
        break;
      case 1:
        emit(ThemeMode.dark);
        break;

      case 2:
        emit(ThemeMode.light);
        break;
    }
  }
}
