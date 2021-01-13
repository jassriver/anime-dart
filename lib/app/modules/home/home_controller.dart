import '../../shared/interfaces/state_controller.dart';

class HomeController extends StateController {
  int count = 0;

  bool get isZero => count == 0;

  void increment() => setState(() => ++count);

  @override
  void dispose() {
    super.dispose();
  }
}
