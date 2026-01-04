import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {


  @override
  void onReady() {
    super.onReady();
    _startOnboarding();
  }

  _startOnboarding() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAllNamed(Routes.HOME);

    // if (Storage.isUserTokenExists()) {
    //   Get.offAllNamed(Routes.HOME);
    // } else {
    //   Get.offAllNamed(Routes.WELCOME);
    // }
  }
}