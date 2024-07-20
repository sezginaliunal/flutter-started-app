import 'package:get/get.dart';
import 'package:started_app/app/features/user/user.dart';
import 'package:started_app/core/config/constants/api_urls.dart';
import 'package:started_app/core/services/api/base_network.dart';

class SplashController extends GetxController {
  // UserService örneğini oluşturun
  final UserService _userService = UserService();

  // Kullanıcı bilgisini depolamak için bir Rx<User?> değişkeni
  var user = Rx<User?>(null);
  var users = Rx<List<Data>?>(null); // Data türünde liste kullanın

  @override
  void onInit() {
    super.onInit();
    // Kullanıcı bilgisini yükle
    loadUser();
    loadUsers(); // Kullanıcı listesini yükle
  }

  Future<void> loadUser() async {
    // Örneğin, kullanıcı ID'si 1
    const userId = "2";
    final fetchedUser =
        await _userService.getData('${ApiUrls.users.rawValue}/$userId');

    if (fetchedUser != null) {
      // Kullanıcı bilgisini güncelle
      user.value = fetchedUser;
    } else {
      // Hata veya kullanıcı bulunamadı durumunu işleyin
      print('Kullanıcı bilgisi alınamadı');
    }
  }

  Future<void> loadUsers() async {
    final fetchedUser =
        await _userService.getListData('${ApiUrls.users.rawValue}?page=2');

    if (fetchedUser != null) {
      // Kullanıcı listesini güncelle
      users.value = fetchedUser.data; // Data listesini güncelle
    } else {
      // Hata veya kullanıcı bulunamadı durumunu işleyin
      print('Kullanıcılar alınamadı');
    }
  }
}
