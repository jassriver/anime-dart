import 'package:anime_dart/app/shared/enums/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/interfaces/state_controller.dart';

class ThemeController extends StateController implements Disposable {
  ThemeMode theme = ThemeMode.system;
  AppColorScheme colorScheme = AppColorScheme.monochrome;

  void setTheme(final ThemeMode newTheme) {
    setState(() => theme = newTheme);
  }

  void setColorScheme(final AppColorScheme newColorScheme) {
    setState(() => colorScheme = newColorScheme);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
