import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

mixin PseudoSetStateMixin on ChangeNotifier {
  void setState(void Function() updateState) => {
        updateState(),
        notifyListeners(),
      };
}

abstract class StateController extends ChangeNotifier
    with PseudoSetStateMixin
    implements Disposable {}
