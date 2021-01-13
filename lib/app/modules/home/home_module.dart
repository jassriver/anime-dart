import 'package:flutter_modular/flutter_modular.dart';

import '../../blocs/counter/counter_bloc.dart';
import 'home_widget.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<CounterBloc>((_) => CounterBloc()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, __) => HomeWidget(),
        ),
      ];
}
