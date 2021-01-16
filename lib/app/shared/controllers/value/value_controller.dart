import '../../state/state.dart';

class ValueController<T> extends StateController {
  T value;

  ValueController({T initialValue}) : value = initialValue;

  @action
  void set(T newValue) => setState(() => value = newValue);
}
