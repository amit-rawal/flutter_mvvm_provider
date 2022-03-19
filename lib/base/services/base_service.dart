import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/base/Model/base_request_model.dart';
import 'package:flutter_mvvm_provider/utility/constants/api_constants.dart';

import '../../utility/helpers/APIHelper/api_response_model.dart';

class BaseServiceManager {
  BaseServiceManager._internal() {
    _dio = Dio();
  }

  static final BaseServiceManager _instance = BaseServiceManager._internal();

  static BaseServiceManager get sharedInstance => _instance;

  factory BaseServiceManager() => _instance;

  static late final Dio _dio;

  ///This method [_validateStatus] always returns true so that dio returns data for any http status code
  static bool _validateStatus(_) => true;
  static const bool _receiveDataWhenStatusError = true;
  static const int _defaultTimeOut = 45;

  Future<ServiceResponseModel> sendRequest(
      BaseRequestModel requestModel) async {
    String _url = ApiConstants.appBaseURL + requestModel.path;
    debugPrint(">>> url $_url");

    late final Response httpResponse;

    try {
      switch (requestModel.requestType) {
        case RequestType.get:
          httpResponse = await _dio
              .get(
            _url,
            queryParameters: requestModel.param,
            options: Options(
              headers: requestModel.header,
              receiveDataWhenStatusError: _receiveDataWhenStatusError,
              validateStatus: _validateStatus,
            ),
          )
              .timeout(Duration(seconds: _defaultTimeOut));
          break;

        case RequestType.put:
          httpResponse = await _dio
              .put(
            _url,
            queryParameters: requestModel.param,
            data: requestModel.body,
            options: Options(
              headers: requestModel.header,
              receiveDataWhenStatusError: _receiveDataWhenStatusError,
              validateStatus: _validateStatus,
            ),
          )
              .timeout(Duration(seconds: _defaultTimeOut));
          break;

        case RequestType.post:
          httpResponse = await _dio
              .post(
            _url,
            queryParameters: requestModel.param,
            data: requestModel.body,
            options: Options(
              headers: requestModel.header,
              receiveDataWhenStatusError: _receiveDataWhenStatusError,
              validateStatus: _validateStatus,
            ),
          )
              .timeout(Duration(seconds: _defaultTimeOut));
          break;

        case RequestType.patch:
          httpResponse = await _dio
              .patch(
            _url,
            queryParameters: requestModel.param,
            data: requestModel.body,
            options: Options(
              headers: requestModel.header,
              receiveDataWhenStatusError: _receiveDataWhenStatusError,
              validateStatus: _validateStatus,
            ),
          )
              .timeout(Duration(seconds: _defaultTimeOut));
          break;

        case RequestType.delete:
          httpResponse = await _dio
              .delete(
            _url,
            queryParameters: requestModel.param,
            data: requestModel.body,
            options: Options(
              headers: requestModel.header,
              receiveDataWhenStatusError: _receiveDataWhenStatusError,
              validateStatus: _validateStatus,
            ),
          )
              .timeout(Duration(seconds: _defaultTimeOut));
          break;
      }
    } on SocketException {
      return ServiceResponseModel(
          statusCode: NO_INTERNET, errorMessage: 'No Internet Connection');
    }

    return _handleResponse(httpResponse);
  }

  ServiceResponseModel _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        debugPrint("response.data.toString() = ${response.data.toString()}");
        return ServiceResponseModel(
            isSuccess: true,
            data: response.data,
            statusCode: response.statusCode!);

      case 400:
        return ServiceResponseModel(
            statusCode: response.statusCode!, errorMessage: "Invalid Request:");
      case 401:

      case 403:
        return ServiceResponseModel(
            statusCode: response.statusCode!, errorMessage: 'Unauthorised: ');
      case 500:

      default:
        return ServiceResponseModel(
            statusCode: response.statusCode ?? 0,
            errorMessage:
            'Error During Communication: Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}


// Success
const SUCCESS = 200;

// Errors
const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;