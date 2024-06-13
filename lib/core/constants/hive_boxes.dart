enum HiveBoxConstants { settings, mobileSettings }

extension HiveBoxConstantsExtension on HiveBoxConstants {
  String get value {
    switch (this) {
      case HiveBoxConstants.settings:
        return 'settings';
      case HiveBoxConstants.mobileSettings:
        return 'mobileSettings';
    }
  }
}
