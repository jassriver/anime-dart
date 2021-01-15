import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../shared/state/controllers/state_controller.dart';
import 'i18n_config.dart';

class I18nController extends StateController {
  final I18nConfig _config;

  Locale locale;

  I18nController(this._config);

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initialize(
    Future<Locale> Function(I18nConfig) getInitialLocale,
  ) async {
    locale = await getInitialLocale(_config);
  }

  Future<void> setLocale(BuildContext context, Locale newLocale) async {
    await _config.cacheManager
      ..setKey(
        _getCountryCodeKey(_config),
        newLocale.countryCode,
      )
      ..setKey(
        _getLanguageCodeKey(_config),
        newLocale.languageCode,
      );

    await FlutterI18n.refresh(context, newLocale);

    setState(() => locale = newLocale);
  }

  static Future<Locale> getInitialLocale(I18nConfig config) async {
    final langCode =
        await config.cacheManager.getKey(_getLanguageCodeKey(config));
    final countryCode =
        await config.cacheManager.getKey(_getCountryCodeKey(config));

    final hasCache = langCode != null && countryCode != null;

    return hasCache ? Locale(langCode, countryCode) : null;
  }

  static String _getCountryCodeKey(I18nConfig config) {
    return '${config.cacheKey}__COUNTRY_CODE';
  }

  static String _getLanguageCodeKey(I18nConfig config) {
    return '${config.cacheKey}__LANGUAGE_CODE';
  }
}
