import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/i18n/i18n_controller.dart';
import 'modules/theme/theme_controller.dart';
import 'modules/theme/theme_provider.dart';
import 'shared/state/builders/multi_state_builder.dart';

class AppWidget extends StatelessWidget {
  final _themeController = Modular.get<ThemeController>();
  final _i18nController = Modular.get<I18nController>();
  final _i18nDelegate = Modular.get<LocalizationsDelegate>();

  AppWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeController: _themeController,
      child: MultiStateBuilder(
        controllers: [_themeController, _i18nController],
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
            localizationsDelegates: [
              _i18nDelegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
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
