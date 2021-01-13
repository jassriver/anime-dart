import 'package:anime_dart/app/modules/theme/theme_controller.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeController themeController;

  const ThemeProvider({
    Widget child,
    this.themeController,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
