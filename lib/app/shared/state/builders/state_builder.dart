import 'package:flutter/material.dart';

import '../widgets/state_widget.dart';

class StateBuilder extends StateWidget {
  final TransitionBuilder builder;

  final Widget child;

  const StateBuilder({
    Key key,
    @required Listenable controller,
    @required this.builder,
    this.child,
  })  : assert(controller != null),
        assert(builder != null),
        super(key: key, controller: controller);

  @override
  Widget build(BuildContext context) {
    return builder(context, child);
  }
}
