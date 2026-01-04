import 'package:project_starter/app/data/repository/home_repository.dart';
import 'package:project_starter/base/base_controller.dart';

import '../../../../utils/helper/custom_snackbar.dart';
import '../../../../utils/loader/loading_utils.dart';

class HomeController extends BaseController<HomeRepository> {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> apiCall() async {
    try {
      LoadingUtils.showLoader();
      final response = await repository.dummyAPI();
      if (response.code == 200) {
        LoadingUtils.hideLoader();
        CustomSnackBar.showSuccess(response.message);
      } else {
        LoadingUtils.hideLoader();
        CustomSnackBar.showError(response.message);
      }
    } catch (e) {
      LoadingUtils.hideLoader();
      final String err =  e.toString().toLowerCase().startsWith('type') ?  "Something went wrong." : e.toString();
      CustomSnackBar.showError(err);
    }
  }

}
