import 'package:get/get.dart';
import 'package:started_app/core/res/translation/en.dart';
import 'package:started_app/core/res/translation/tr.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'tr_TR': tr,
      };
}
