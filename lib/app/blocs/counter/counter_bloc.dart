import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class CounterBloc extends Disposable {
  final _controller = StreamController<int>()
    ..sink
    ..add(0);

  StreamSink get sink => _controller.sink;
  Stream get stream => _controller.stream;

  void increment([int amount = 1]) async {
    assert(amount != null);

    sink.add(await stream.last + amount);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
