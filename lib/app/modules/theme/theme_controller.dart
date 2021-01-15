import 'package:flutter/material.dart';

import '../../shared/enums/app_color_scheme.dart';
import '../../shared/interfaces/state_controller.dart';
import 'theme_config.dart';

class ThemeController extends StateController {
  final ThemeConfig _themeConfig;

  ThemeMode theme;

  AppColorScheme colorScheme;
  var _initialized = false;

  ThemeController(this._themeConfig);

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initialize(
    Future<ThemeMode> Function(ThemeConfig) getInitialTheme,
    Future<AppColorScheme> Function(ThemeConfig) getInitialColorScheme,
  ) async {
    _initialized = true;

    theme = await getInitialTheme(_themeConfig);
    colorScheme = await getInitialColorScheme(_themeConfig);
  }

  Future<void> resetDefault() async {
    assert(_initialized);

    _themeConfig.cacheManager
      ..deleteKey(_getThemeKey(_themeConfig))
      ..deleteKey(_getColorSchemeKey(_themeConfig));

    setState(() => theme = ThemeMode.system);
  }

  Future<void> setColorScheme(AppColorScheme newColorScheme) async {
    assert(_initialized);

    await _themeConfig.cacheManager
        .setKey(_getColorSchemeKey(_themeConfig), newColorScheme.toString());

    setState(() => colorScheme = newColorScheme);
  }

  Future<void> setTheme(ThemeMode newTheme) async {
    assert(_initialized);

    await _themeConfig.cacheManager
        .setKey(_getThemeKey(_themeConfig), newTheme.toString());

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
