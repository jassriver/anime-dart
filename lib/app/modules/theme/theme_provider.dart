import 'package:flutter/cupertino.dart';

import 'theme_controller.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeController themeController;

  const ThemeProvider({
    Widget child,
    this.themeController,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
