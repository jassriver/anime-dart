import 'package:anime_dart/app/shared/state/builders/state_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../theme/theme_controller.dart';
import '../../theme/theme_provider.dart';
import '../home_controller.dart';
import 'home_content_controller.dart';

class HomeContentPage extends StatefulWidget {
  HomeContentPage({Key key}) : super(key: key);

  @override
  _HomeContentPageState createState() => _HomeContentPageState();
}

class _HomeContentPageState
    extends ModularState<HomeContentPage, HomeContentController> {
  final _homeController = Modular.get<HomeController>();

  ThemeController get _themeController =>
      ThemeProvider.of(context).themeController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              child: Text('Dark Theme '),
              onPressed: () {
                _themeController.setTheme(ThemeMode.dark);
              },
            ),
            RaisedButton(
              child: Text('Light Theme '),
              onPressed: () {
                _themeController.setTheme(ThemeMode.light);
              },
            ),
            RaisedButton(
              child: Text('System Theme '),
              onPressed: () {
                _themeController.setTheme(ThemeMode.light);
              },
            ),
            RaisedButton(
              child: Text('Reset Default'),
              onPressed: () {
                _themeController.setTheme(ThemeMode.light);
              },
            ),
            RaisedButton(
              child: Text('Change language'),
              onPressed: () {
                Modular.navigator.pushNamed('/i18n');
              },
            ),
            Center(
              child: StateBuilder(
                controller: _homeController,
                builder: (context, child) {
                  return Text(
                    FlutterI18n.plural(
                      context,
                      'ui.clicked',
                      _homeController.count,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
