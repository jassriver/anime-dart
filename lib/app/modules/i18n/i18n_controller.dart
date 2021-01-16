import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../shared/enums/app_language.dart';
import '../../shared/state/state.dart';
import 'i18n_config.dart';

typedef LocaleCacheHandler = Future<Locale> Function(I18nConfig, AppLanguage);

class I18nController extends StateController {
  final LocaleCacheHandler _getInitialLocale;
  final I18nConfig _config;

  Locale locale;
  Locale sourcesLocale;

  I18nController(
    this._config, {
    @required LocaleCacheHandler getInitialLocale,
  }) : _getInitialLocale = getInitialLocale;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initialize() async {
    locale = await _getInitialLocale(_config, AppLanguage.interface);
    sourcesLocale = await _getInitialLocale(_config, AppLanguage.sources);
  }

  @action
  Future<void> setLocale(
    BuildContext context,
    Locale newLocale, {
    AppLanguage langContext = AppLanguage.interface,
  }) async {
    await _config.cacheManager
      ..setKey(
        _getCountryCodeKey(_config, langContext),
        newLocale.countryCode,
      )
      ..setKey(
        _getLangCodeKey(_config, langContext),
        newLocale.languageCode,
      );

    await FlutterI18n.refresh(context, newLocale);

    setState(() => locale = newLocale);
  }

  static Future<Locale> getInitialLocale(
    I18nConfig config,
    AppLanguage context,
  ) async {
    final langCode =
        await config.cacheManager.getKey(_getLangCodeKey(config, context));
    final countryCode =
        await config.cacheManager.getKey(_getCountryCodeKey(config, context));

    final hasCache = langCode != null && countryCode != null;

    return hasCache ? Locale(langCode, countryCode) : null;
  }

  static String _getCountryCodeKey(I18nConfig config, AppLanguage context) {
    return '${config.cacheKey}__${context.toString()}__COUNTRY_CODE';
  }

  static String _getLangCodeKey(I18nConfig config, AppLanguage targetContext) {
    return '${config.cacheKey}__${targetContext.toString()}__LANGUAGE_CODE';
  }
}
