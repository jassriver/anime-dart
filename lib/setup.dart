import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';

Future<void> setup() async {
  final flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: 'pt_br',
      basePath: 'assets/i18n',
      forcedLocale: Locale('pt', 'BR'),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await flutterI18nDelegate.load(null);
}
