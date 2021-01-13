import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/theme/theme_controller.dart';
import 'modules/theme/theme_provider.dart';

class AppWidget extends StatelessWidget {
  final _themeController = ThemeController();

  AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeController: _themeController,
      child: AnimatedBuilder(
        animation: _themeController,
        builder: (_, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData.dark().copyWith(
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            themeMode: _themeController.theme,
            initialRoute: "/",
            navigatorKey: Modular.navigatorKey,
            onGenerateRoute: Modular.generateRoute,
          );
        },
      ),
    );
  }
}
