import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'releases_controller.dart';

class ReleasesPage extends StatefulWidget {
  ReleasesPage({Key key}) : super(key: key);

  @override
  _ReleasesModuleState createState() => _ReleasesModuleState();
}

class _ReleasesModuleState
    extends ModularState<ReleasesPage, ReleasesController> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Releases'));
  }
}
