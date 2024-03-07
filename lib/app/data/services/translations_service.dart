import 'package:get/get.dart';
import 'package:started_app/app/res/translation/ar.dart';
import 'package:started_app/app/res/translation/en.dart';
import 'package:started_app/app/res/translation/tr.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'ar_AR': ar,
        'tr_TR': tr,
      };
}
