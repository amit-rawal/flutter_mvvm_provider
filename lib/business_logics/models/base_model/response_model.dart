class BaseResponseModel {
  bool isSucessful;
  dynamic data;
  String? error;
  String? message;

  BaseResponseModel(this.isSucessful, {this.data, this.error, this.message});
}
