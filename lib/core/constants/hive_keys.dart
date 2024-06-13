enum HiveKeysConstants { theme, mobileSettingsKey }

extension HiveKeysConstantsExtension on HiveKeysConstants {
  String get value {
    switch (this) {
      case HiveKeysConstants.theme:
        return 'theme';
      case HiveKeysConstants.mobileSettingsKey:
        return 'mobileSettingsKey';
    }
  }
}
