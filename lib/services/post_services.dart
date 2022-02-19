import 'package:flutter_mvvm_provider/business_logics/models/base_model/response_model.dart';
import 'package:flutter_mvvm_provider/business_logics/models/posts/post_request_model.dart';
import 'package:flutter_mvvm_provider/utility/helpers/api_manager.dart';

class PostServices {
  Future<BaseResponseModel> getPosts() async {
    final response =
        await APIManager.sharedInstance.sendRequest(PostRequestModel());
    return response;
  }
}
