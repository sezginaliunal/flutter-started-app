import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var firstSettings = controller.getFirstSettingsValue();
          if (firstSettings != null) {
            // Burada firstSettings nesnesinin özelliklerini kullanabilirsiniz
            // Örneğin: firstSettings.name gibi
            print('First settings: ${firstSettings.bgcolor2}');
          } else {
            print('No settings available.');
          }
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.settingsList.length,
            itemBuilder: (context, index) {
              var settings = controller.settingsList[index];
              return ListTile(
                title: Text(settings.ApiUrl
                    .toString()), // Burada MobileSettings modeline göre uygun bir property ekleyin
                subtitle: Text(settings.AppUrl
                    .toString()), // Gerekli diğer özellikleri buraya ekleyin
                // İstenirse onTap gibi eventler de burada kullanılabilir
              );
            },
          )),
    );
  }
}
