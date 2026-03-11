import 'package:get/get.dart';
import 'package:project_starter/app/data/repository/home_repository.dart';
import 'package:project_starter/app/data/values/constants.dart';
import 'package:project_starter/app/modules/home/models/user_response.dart';
import 'package:project_starter/base/base_controller.dart';

class HomeController extends BaseController<HomeRepository> {

  final usersList = <UserResponse>[].obs;
  final filteredUsers = <UserResponse>[].obs;

  final Rx<RxStatus> usersListStatus = RxStatus.loading().obs;

  @override
  void onReady() {
    super.onReady();
    getUserList();
  }

  Future<void> getUserList() async {
    usersListStatus.value = RxStatus.loading();

    try {
      final response = await repository.userAPI();

      if (response.isNotEmpty) {
        usersList.assignAll(response);
        filteredUsers.assignAll(response);
        usersListStatus.value = RxStatus.success();
      } else {
        usersListStatus.value = RxStatus.empty();
      }

    } catch (e) {
      LoggerPrint.error(e.toString());
      usersListStatus.value = RxStatus.error(e.toString());
    }
  }

  /// Search Users
  void onSearch(String value) {

    if (value.isEmpty) {
      filteredUsers.assignAll(usersList);
      return;
    }

    final query = value.toLowerCase();

    filteredUsers.assignAll(
      usersList.where((user) =>
      (user.name ?? "").toLowerCase().contains(query) ||
          (user.email ?? "").toLowerCase().contains(query) ||
          (user.company?.name ?? "").toLowerCase().contains(query)),
    );
  }

  /// Pull to Refresh
  Future<void> refreshUsers() async {
    await getUserList();
  }
}