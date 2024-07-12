enum HiveKeysConstants { theme }

extension HiveKeysConstantsExtension on HiveKeysConstants {
  String get value {
    switch (this) {
      case HiveKeysConstants.theme:
        return 'theme';
    }
  }
}
