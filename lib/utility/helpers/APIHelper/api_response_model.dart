class ServiceResponseModel {
  int statusCode;
  final bool isSuccess;
  final String? errorMessage;
  final dynamic data;

  ServiceResponseModel(
      {this.isSuccess = false,
      required this.statusCode,
      this.errorMessage,
      this.data});
}

class ResponseModel {
  dynamic data;
  String? errorMessage;
  bool isSuccess;

  ResponseModel({this.data, this.errorMessage, this.isSuccess = true});
}

//API status enums
enum ApiStatus {
  idle,
  started,
  completed,
  loading,
  searching,
  empty,
  failed,
  timeout
}
