import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'library_controller.dart';

class LibraryPage extends StatefulWidget {
  LibraryPage({Key key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends ModularState<LibraryPage, LibraryController> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Library'));
  }
}
