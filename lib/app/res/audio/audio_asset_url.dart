enum AudioPath {
  click,
}

extension AudioPathExtension on AudioPath {
  String _path() {
    switch (this) {
      case AudioPath.click:
        return 'click';
    }
  }

  String get soundPath => 'sounds/${_path()}.mp3';
}
