import 'package:get_storage/get_storage.dart';

class Storage {
  Storage._privateConstructor();

  static final _box = GetStorage();

  // static UserProfile getUser() => UserProfile.fromJson(_box.read(StorageKeys.user));

  // static Future<void> setUser(UserProfile? user) => _box.write(StorageKeys.user, user?.toJson());

  // static bool isUserProfileExists() => _box.read(StorageKeys.user) != null;

  static String getUserToken() => _box.read(StorageKeys.userToken);

  static Future<void> setUserToken(String? userToken) => _box.write(StorageKeys.userToken, userToken);

  static bool isUserTokenExists() => _box.read(StorageKeys.userToken) != null;

  static void erase() => _box.erase();
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const user = 'user';
  static const uuid = 'uuid';
  static const userToken = 'user-token';
  static const device = 'device';
  static const deviceId = 'device-id';
  static const deviceType = 'device-type';
  static const socialMedia = 'social-media';
}
