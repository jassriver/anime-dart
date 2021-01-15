import '../../shared/state/state_controller.dart';

class HomeController extends StateController {
  int count = 0;

  bool get isZero => count == 0;

  @override
  void dispose() {
    super.dispose();
  }

  void increment() => setState(() => ++count);
}
