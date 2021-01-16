const action = _Action();

class _Action {
  const _Action();

  @override
  String toString() {
    return '''
      Controllers methods marked as `@action` can access [setState] method to update UI
    ''';
  }
}
