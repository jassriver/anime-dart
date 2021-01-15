import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class StateController extends ChangeNotifier implements Disposable {
  @protected
  void setState(void Function() updateState) {
    updateState();
    notifyListeners();
  }
}
