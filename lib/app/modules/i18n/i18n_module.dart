import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/controllers/value/value_controller.dart';
import 'i18n_controller.dart';
import 'i18n_page.dart';

class I18nModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<I18nController>(
          (_) => I18nController(),
        ),
        Bind<ValueController<int>>(
          (_) => ValueController<int>(initialValue: 0),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter<I18nPage>(
          '/',
          child: (_, __) => I18nPage(),
        ),
      ];
}
