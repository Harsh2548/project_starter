import 'package:get/get.dart';
import 'package:project_starter/app/data/repository/home_repository.dart';
import 'data/network/network_requester.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkRequester(), permanent: true);
    Get.put(HomeRepository(), permanent: true);
  }
}
