import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'i18n_controller.dart';

class I18nPage extends StatefulWidget {
  I18nPage({Key key}) : super(key: key);

  @override
  _I18nPageState createState() => _I18nPageState();
}

class _I18nPageState extends ModularState<I18nPage, I18nController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ok'),
        actions: [],
      ),
    );
  }
}
