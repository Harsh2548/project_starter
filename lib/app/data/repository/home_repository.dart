import 'package:project_starter/base/base_repository.dart';
import '../../../utils/helper/exception_handler.dart';
import '../network/response_wrapper.dart';
import '../values/urls.dart';

class HomeRepository extends BaseRepository{
  Future<ResponseWrapper> dummyAPI() async {
    final response = await controller.get(path: URLs.dummyAPI);
    return response is APIException
        ? ResponseWrapper(message: response.message)
        : ResponseWrapper.fromJson(response,(data) => data);
  }
}