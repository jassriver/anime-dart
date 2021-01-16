import 'package:flutter/material.dart';

import '../../shared/enums/app_color_scheme.dart';
import '../../shared/state/state.dart';
import 'theme_config.dart';

typedef ThemeCacheHandler = Future<ThemeMode> Function(ThemeConfig);
typedef SchemeCacheHandler = Future<AppColorScheme> Function(ThemeConfig);

class ThemeController extends StateController {
  final ThemeConfig _config;
  final ThemeCacheHandler _getInitialTheme;
  final SchemeCacheHandler _getInitialColorScheme;

  ThemeMode theme;
  AppColorScheme colorScheme;

  ThemeController(
    this._config, {
    @required ThemeCacheHandler getInitialTheme,
    @required SchemeCacheHandler getInitialColorScheme,
  })  : _getInitialTheme = getInitialTheme,
        _getInitialColorScheme = getInitialColorScheme;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initialize() async {
    theme = await _getInitialTheme(_config);
    colorScheme = await _getInitialColorScheme(_config);
  }

  @action
  Future<void> resetDefault() async {
    _config.cacheManager
      ..deleteKey(_getThemeKey(_config))
      ..deleteKey(_getColorSchemeKey(_config));

    setState(() => theme = ThemeMode.system);
  }

  @action
  Future<void> setColorScheme(AppColorScheme newColorScheme) async {
    await _config.cacheManager
        .setKey(_getColorSchemeKey(_config), newColorScheme.toString());

    setState(() => colorScheme = newColorScheme);
  }

  @action
  Future<void> setTheme(ThemeMode newTheme) async {
    await _config.cacheManager
        .setKey(_getThemeKey(_config), newTheme.toString());

    setState(() => theme = newTheme);
  }

  static Future<AppColorScheme> getInitialColorScheme(
    ThemeConfig themeConfig,
  ) async {
    final schemeValue =
        await themeConfig.cacheManager.getKey(_getColorSchemeKey(themeConfig));

    return _mapColorScheme(schemeValue ?? AppColorScheme.monochrome.toString());
  }

  static Future<ThemeMode> getInitialTheme(ThemeConfig themeConfig) async {
    final themeValue =
        await themeConfig.cacheManager.getKey(_getThemeKey(themeConfig));

    return _mapTheme(themeValue ?? ThemeMode.system.toString());
  }

  static String _getColorSchemeKey(ThemeConfig themeConfig) {
    return '${themeConfig.cacheKey}__COLOR_SCHEME';
  }

  static String _getThemeKey(ThemeConfig themeConfig) {
    return '${themeConfig.cacheKey}__THEME';
  }

  static AppColorScheme _mapColorScheme(String value) {
    final mapColorScheme = <String, AppColorScheme>{
      AppColorScheme.blue.toString(): AppColorScheme.blue,
      AppColorScheme.cyan.toString(): AppColorScheme.cyan,
      AppColorScheme.monochrome.toString(): AppColorScheme.monochrome,
      AppColorScheme.purple.toString(): AppColorScheme.purple,
      AppColorScheme.red.toString(): AppColorScheme.red,
    };

    return mapColorScheme[value];
  }

  static ThemeMode _mapTheme(String value) {
    final mapTheme = <String, ThemeMode>{
      ThemeMode.system.toString(): ThemeMode.system,
      ThemeMode.dark.toString(): ThemeMode.dark,
      ThemeMode.light.toString(): ThemeMode.light,
    };

    return mapTheme[value];
  }
}
