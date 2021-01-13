import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../../shared/controllers/value/value_controller.dart';
import '../library/library_module.dart';
import '../releases/releases_module.dart';
import 'home_content/home_content_module.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final tabs = <Widget>[
    HomeContentModule(),
    ReleasesModule(),
    LibraryModule(),
  ];

  final _valueController = Modular.get<ValueController<int>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _valueController,
        builder: (_, __) => tabs[_valueController.value],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _valueController,
        builder: (_, __) => BottomNavigationBar(
          currentIndex: _valueController.value,
          showUnselectedLabels: false,
          onTap: _valueController.set,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                OMIcons.home,
                size: 30.0,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 30.0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                OMIcons.newReleases,
                size: 30.0,
              ),
              activeIcon: Icon(
                Icons.new_releases,
                size: 30.0,
              ),
              label: 'Releases',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                OMIcons.folder,
                size: 30.0,
              ),
              activeIcon: Icon(
                Icons.folder,
                size: 30.0,
              ),
              label: 'Library',
            ),
          ],
        ),
      ),
    );
  }
}
