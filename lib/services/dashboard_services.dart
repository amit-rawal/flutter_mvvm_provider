import 'package:flutter_mvvm_provider/base/services/base_service.dart';
import 'package:flutter_mvvm_provider/utility/helpers/APIHelper/api_response_model.dart';

import '../models/dashboard/user_request_model.dart';
import '../models/dashboard/users_response_model.dart';

class DashboardServices {
  Future<ResponseModel> getUsers() async {
    final ServiceResponseModel response = await BaseServiceManager
        .sharedInstance
        .sendRequest(UsersRequestModel());

    if (response.isSuccess) {
      try {
        return ResponseModel(
            data: userlistFromJson(response.data as List<dynamic>));
      } catch (e) {
        return ResponseModel(
            errorMessage: 'Parsing Error : ${e.toString()}', isSuccess: false);
      }
    } else {
      return ResponseModel(
          errorMessage: "error: ${response.errorMessage}", isSuccess: false);
    }
  }
}
