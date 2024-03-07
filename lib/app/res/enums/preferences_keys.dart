enum PreferencesKeys { TOKEN, THEME_MODE, LOCALE }

extension PreferencesKeysExtension on PreferencesKeys {
  String toKeyName() {
    switch (this) {
      case PreferencesKeys.TOKEN:
        return 'TOKEN';
      case PreferencesKeys.THEME_MODE:
        return 'THEME_MODE';
      case PreferencesKeys.LOCALE:
        return 'LOCALE';
    }
  }
}
