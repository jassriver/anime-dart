import '../../shared/interfaces/state_controller.dart';

class CounterController extends StateController {
  int count = 0;
  bool loading = false;

  void increment([final int amount = 1]) async {
    if (loading) return;

    loading = true;

    setState(() => loading = true);

    setState(() async {
      count += amount;
      loading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
