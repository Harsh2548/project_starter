import 'package:project_starter/app/modules/home/models/user_response.dart';
import 'package:project_starter/base/base_repository.dart';
import '../../../utils/helper/exception_handler.dart';
import '../values/urls.dart';

class HomeRepository extends BaseRepository{
  Future<List<UserResponse>> userAPI() async {
    final response = await controller.get(path: URLs.userAPI);

    if (response is APIException) {
      throw response.message;
    }

    return (response as List)
        .map((e) => UserResponse.fromJson(e))
        .toList();
  }
}