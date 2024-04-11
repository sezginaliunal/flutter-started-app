enum IconItems {
  rosary,

}

extension IconItemsExtension on IconItems {
  String _path() {
    switch (this) {
      case IconItems.rosary:
        return 'rosary';

    }
  }

  String get imagePath => 'assets/icons/${_path()}.png';
}
