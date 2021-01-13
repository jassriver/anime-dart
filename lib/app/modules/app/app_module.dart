import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          module: HomeModule(),
        ),
      ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  @override
  Widget get bootstrap => AppWidget();
}
