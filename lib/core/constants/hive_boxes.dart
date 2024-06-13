enum HiveBoxConstants {
  settings,
}

extension HiveBoxConstantsExtension on HiveBoxConstants {
  String get value {
    switch (this) {
      case HiveBoxConstants.settings:
        return 'settings';
    }
  }
}
