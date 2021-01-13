import 'package:anime_dart/app/modules/home/home_content/home_content_controller.dart';
import 'package:anime_dart/app/modules/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeContentPage extends StatefulWidget {
  HomeContentPage({Key key}) : super(key: key);

  @override
  _HomeContentPageState createState() => _HomeContentPageState();
}

class _HomeContentPageState
    extends ModularState<HomeContentPage, HomeContentController> {
  final _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _homeController,
        builder: (context, child) {
          return Text(
            '''Home Content Page ${_homeController.count} -\n
            Is zero: ${_homeController.isZero}''',
          );
        },
      ),
    );
  }
}
