import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/counter/counter_controller.dart';
import 'home_widget.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<CounterController>((_) => CounterController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, __) => HomeWidget(),
        ),
      ];
}
