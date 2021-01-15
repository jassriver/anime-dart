import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../setup.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/i18n/i18n_module.dart';
import 'modules/theme/theme_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ThemeController>(
          (_) => getIt.get<ThemeController>(),
        ),
        Bind<LocalizationsDelegate>(
          (_) => getIt.get<LocalizationsDelegate>(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          module: HomeModule(),
        ),
        ModularRouter(
          '/i18n',
          module: I18nModule(),
        ),
      ];
}
