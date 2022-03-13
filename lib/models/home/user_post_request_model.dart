import 'package:flutter_mvvm_provider/models/base_model/base_request_model.dart';
import 'package:flutter_mvvm_provider/utility/constants/api_constants.dart';

class PostRequestModel extends BaseRequestModel {
  PostRequestModel();

  @override
  String get path => ApiConstants.getPosts;

  // @override
  // Map<String, String> get header => {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json",
  //     };

  // @override
  // Map<String, String> get param => {"mobile_number": mobileNumber};

  @override
  RequestType get requestType => RequestType.get;
}
