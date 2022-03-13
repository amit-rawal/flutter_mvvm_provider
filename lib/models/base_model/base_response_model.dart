class BaseResponseModel<T> {
  APIStatus apiStatus = APIStatus.idle;
  String? message;

  BaseResponseModel(this.apiStatus, this.message);
}

enum APIStatus { idle, loading, completed, error }
