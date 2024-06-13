// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive_intro/models/user.dart';
// import '../../lib/core/services/base_cache.dart';

// void main() {
//   final UserCacheManager cacheManager = UserCacheManager('users');

//   setUp(() async {
//     Hive.init('database');
//     await cacheManager.init();
//     await cacheManager.clearAll();
//   });

//   tearDown(() async {
//     await cacheManager.clearAll();
//   });

//   test('Name Box Create and Put', () async {
//     final user = User("1", "Sezgin", 2);
//     await cacheManager.putItem("User1", user);

//     final retrievedUser = cacheManager.getItem("User1");
//     expect(retrievedUser?.id, user.id);
//     expect(retrievedUser?.name, user.name);
//     expect(retrievedUser?.age, user.age);
//   });
//   test('Add and Retrieve List of Users', () async {
//     final users = [
//       User("1", "Sezgin", 2),
//       User("2", "Ahmet", 25),
//       User("3", "Ayşe", 30),
//     ];
//     await cacheManager.addItems(users);

//     final retrievedUsers = await cacheManager.getValues();
//     expect(retrievedUsers, isNotNull);
//     expect(retrievedUsers?.length, users.length);

//     for (var user in users) {
//       expect(retrievedUsers, contains(user));
//     }
//   });
// }
