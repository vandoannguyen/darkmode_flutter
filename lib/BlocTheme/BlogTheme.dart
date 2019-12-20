import 'dart:async';

class BlogTheme {
  static StreamController _streamController;

  BlogTheme() {
    _streamController = new StreamController.broadcast();
  }
  Stream getStream() {
    return _streamController.stream;
  }

  Sink sink() {
    return _streamController.sink;
  }

  void dispose() {
    if (_streamController != null) _streamController.close();
  }
}
