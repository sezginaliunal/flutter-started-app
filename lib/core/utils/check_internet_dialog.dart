import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityDialog {
  static Future<void> show() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.defaultDialog(
        title: 'Bağlantı Hatası',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('İnternet bağlantınız yok.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Sadece butona basarak kapatma
              },
              child: const Text('Tamam'),
            ),
          ],
        ),
        barrierDismissible: false, // Diğer yerlere tıklanarak kapatılamaz
        onWillPop: () async {
          //!Todo => Quit App
          // Android alt menüden geri butonuna basıldığında kapatmayı engeller
          return false;
        },
      );
    }
  }
}
