import '../../state/state_controller.dart';

class ValueController<T> extends StateController {
  T value;

  ValueController({T initialValue}) : value = initialValue;

  void set(T newValue) => setState(() => value = newValue);
}
