import 'package:flutter_mvvm_provider/models/base_model/request_model.dart';
import 'package:flutter_mvvm_provider/utility/constants/api_constants.dart';

class PostRequestModel extends BaseRequestModel {
  PostRequestModel();

  @override
  String get path => ApiConstants.getPosts;

  @override
  RequestType get requestType => RequestType.get;
}

// import 'package:flutter_mvvm_provider/models/common/ApiGenericModel/request_model.dart';
// import 'package:flutter_mvvm_provider/utility/constants/api_constants.dart';
//
// class VerifyNumberRequestModel extends RequestModel {
//   final String mobileNumber;
//   VerifyNumberRequestModel({required this.mobileNumber});
//
//   @override
//   String get path => ApiConstants.verifyMobileNo;
//
//   @override
//   Map<String, String> get header => {
//         "Content-Type": "application/json",
//         "Accept": "application/vnd.ffd.v1+json",
//       };
//
//   @override
//   Map<String, String> get param => {"mobile_number": mobileNumber};
//
//   @override
//   RequestType get requestType => RequestType.get;
// }
