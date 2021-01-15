import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:get_it/get_it.dart';

import 'app/modules/cache/cache_manager.dart';
import 'app/modules/cache/local_storage.dart';
import 'app/modules/i18n/i18n_config.dart';
import 'app/modules/i18n/i18n_controller.dart';
import 'app/modules/theme/theme_config.dart';
import 'app/modules/theme/theme_controller.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupTheme();
  await _setupI18n();
}

Future<void> _setupI18n() async {
  final flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: true,
      fallbackFile: 'pt_br',
      basePath: 'assets/i18n',
    ),
  );

  await flutterI18nDelegate.load(null);

  final i18nController = I18nController(
    I18nConfig(
      cacheKey: 'APP_LOCALE',
      cacheManager: CacheManager(LocalStorage()),
    ),
  );

  getIt.registerSingleton<I18nController>(i18nController);
  getIt.registerSingleton<LocalizationsDelegate>(flutterI18nDelegate);
}

Future<void> _setupTheme() async {
  final themeController = ThemeController(
    ThemeConfig(
      cacheKey: 'APP_THEME',
      cacheManager: CacheManager(LocalStorage()),
    ),
  );

  themeController.initialize(
    ThemeController.getInitialTheme,
    ThemeController.getInitialColorScheme,
  );

  getIt.registerSingleton<ThemeController>(themeController);
}
