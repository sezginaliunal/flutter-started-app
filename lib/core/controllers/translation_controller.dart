import 'package:started_app/core/res/enums/preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/core/services/storage/get_storage.dart';

class TranslationController extends GetxController {
  final GetStorageService _storageService = GetStorageService();

  final _selectedLanguage = ''.obs;

  String get selectedLanguage => _selectedLanguage.value;

  @override
  void onInit() {
    super.onInit();
    _getSavedLocale();
  }

  Future<void> _getSavedLocale() async {
    final response =
        await _storageService.getData(PreferencesKeys.LOCALE.toKeyName());
    if (response.success && response.data != null) {
      _selectedLanguage.value = response.data as String;
    } else {
      _selectedLanguage.value = 'en_US';
    }
  }

  void changeLanguage(String language) {
    _selectedLanguage.value = language;
    Get.updateLocale(Locale(language));
    _saveLocale(language);
  }

  void _saveLocale(String language) {
    _storageService.saveData(PreferencesKeys.LOCALE.toKeyName(), language);
  }
}
