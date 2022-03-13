enum RequestType { get, put, post, patch, delete }

abstract class BaseRequestModel {
  Map<String, String> get header => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization":
            "", //Todo set authorizastion / bearer token after login
      };

  String get path;

  Map<String, dynamic> get body => {};

  RequestType get requestType;

  Map<String, String> get param => {};
}
