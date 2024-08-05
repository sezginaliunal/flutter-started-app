import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:started_app/core/utils/check_internet_dialog.dart';

class CheckInternetHelper {
  static Future<void> checkInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      await ConnectivityDialog.show();
    }
  }
}
