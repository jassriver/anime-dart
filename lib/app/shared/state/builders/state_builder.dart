import 'package:anime_dart/app/shared/state/controllers/state_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/state_widget.dart';

class StateBuilder<T extends StateController> extends StateWidget {
  final Widget Function(BuildContext, T) builder;

  const StateBuilder({
    Key key,
    @required T controller,
    @required this.builder,
  })  : assert(controller != null),
        assert(builder != null),
        super(key: key, controller: controller);

  @override
  Widget build(BuildContext context) {
    return builder(context, controller);
  }
}
