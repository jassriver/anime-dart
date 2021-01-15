import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class StateBuilder extends StateWidget {
  const StateBuilder({
    Key key,
    @required Listenable controller,
    @required this.builder,
    this.child,
  })  : assert(controller != null),
        assert(builder != null),
        super(key: key, controller: controller);

  final TransitionBuilder builder;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return builder(context, child);
  }
}

class MultiStateBuilder extends MultiStateWidget {
  const MultiStateBuilder({
    Key key,
    @required List<Listenable> controllers,
    @required this.builder,
    this.child,
  })  : assert(controllers != null),
        assert(builder != null),
        super(key: key, controllers: controllers);

  final TransitionBuilder builder;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return builder(context, child);
  }
}

abstract class StateWidget extends StatefulWidget {
  const StateWidget({
    Key key,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  final Listenable controller;

  @protected
  Widget build(BuildContext context);

  @override
  _State createState() => _State();
}

class _State extends State<StateWidget> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_handleChange);
  }

  @override
  void didUpdateWidget(StateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_handleChange);
      widget.controller.addListener(_handleChange);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleChange);

    super.dispose();
  }

  void _handleChange() {
    setState(() {
      // The listenable's state is our build state, and it changed already.
    });
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}

abstract class MultiStateWidget extends StatefulWidget {
  const MultiStateWidget({
    Key key,
    @required this.controllers,
  })  : assert(controllers != null),
        super(key: key);

  final List<Listenable> controllers;

  @protected
  Widget build(BuildContext context);

  @override
  _MultiState createState() => _MultiState();
}

class _MultiState extends State<MultiStateWidget> {
  @override
  void initState() {
    super.initState();

    for (final controller in widget.controllers) {
      controller.addListener(_handleChange);
    }
  }

  @override
  void didUpdateWidget(MultiStateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    for (var i = 0; i < widget.controllers.length; i++) {
      final newController = widget.controllers[i];
      final oldController = oldWidget.controllers[i];

      if (newController != oldController) {
        oldController.removeListener(_handleChange);
        newController.addListener(_handleChange);
      }
    }
  }

  @override
  void dispose() {
    for (final controller in widget.controllers) {
      controller.removeListener(_handleChange);
    }

    super.dispose();
  }

  void _handleChange() {
    setState(() {
      // The listenable's state is our build state, and it changed already.
    });
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}
