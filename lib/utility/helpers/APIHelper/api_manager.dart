import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/base_model/base_request_model.dart';
import 'package:flutter_mvvm_provider/utility/constants/api_constants.dart';
import 'package:flutter_mvvm_provider/utility/helpers/APIHelper/pretty_json.dart';

import 'api_response_model.dart';

// Success
const SUCCESS = 200;

// Errors
const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;

class APIManager {
  APIManager._internal() {
    _dio = Dio();
  }

  static final APIManager _instance = APIManager._internal();

  static APIManager get sharedInstance => _instance;

  factory APIManager() => _instance;

  static late final Dio _dio;

  ///This method [_validateStatus] always returns true so that dio returns data for any http status code
  static bool _validateStatus(_) => true;
  static const bool _receiveDataWhenStatusError = true;
  static const int _defaultTimeOut = 45;

  Future<Object> sendRequest(BaseRequestModel requestModel) async {
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
      return Failure(
          statusCode: NO_INTERNET, errorResponse: 'No Internet Connection');
    }

    var response = _handleResponse(httpResponse);
    return response;
  }

  Object _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        try {
          var parsedJson = jsonDecode(response.data.toString());
          debugPrint("$Response: ${prettyJson(parsedJson)}");
          return Success(
              response: parsedJson, statusCode: response.statusCode!);
        } catch (e) {
          return Failure(
              statusCode: response.statusCode!,
              errorResponse: 'Parsing Error : ${e.toString()}');
        }
      case 400:
        return Failure(
            statusCode: response.statusCode!,
            errorResponse: "Invalid Request:");
      case 401:

      case 403:
        return Failure(
            statusCode: response.statusCode!, errorResponse: 'Unauthorised: ');
      case 500:

      default:
        return Failure(
            statusCode: response.statusCode ?? 0,
            errorResponse:
                'Error During Communication: Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
