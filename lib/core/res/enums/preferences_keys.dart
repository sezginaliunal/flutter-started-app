// ignore_for_file: constant_identifier_names

enum PreferencesKeys { IS_LOGIN, THEME_MODE, LOCALE }

extension PreferencesKeysExtension on PreferencesKeys {
  String toKeyName() {
    switch (this) {
      case PreferencesKeys.IS_LOGIN:
        return 'IS_LOGIN';
      case PreferencesKeys.THEME_MODE:
        return 'THEME_MODE';
      case PreferencesKeys.LOCALE:
        return 'LOCALE';
    }
  }
}
