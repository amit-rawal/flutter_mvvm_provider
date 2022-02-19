import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/base_model/request_model.dart';
import 'package:flutter_mvvm_provider/models/base_model/response_model.dart';
import 'package:flutter_mvvm_provider/utility/constants/api_constants.dart';

import 'network_manager.dart';

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

  Future<BaseResponseModel> sendRequest(BaseRequestModel requestModel) async {
    BaseResponseModel responseModel = BaseResponseModel(false);

    if (!(await NetworkManager.checkConnectivity())) {
      responseModel.error = "No Internet Connection";
      return responseModel;
    }

    String _url = ApiConstants.appBaseURL + requestModel.path;
    debugPrint(">>> url $_url");

    late final Response httpResponse;

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

    debugPrint(">>> status code ${httpResponse.statusCode}");
    debugPrint("httpResponse >>> ${httpResponse.data}");

    if (httpResponse.statusCode == 200) {
      var parsedJson = jsonDecode(httpResponse.data);

      String? error = parsedJson["error"];
      String? message = parsedJson["message"];
      dynamic data = parsedJson["data"];

      if (error != null) {
        debugPrint(">>> Error: $error");
        responseModel.isSucessful = false;
        responseModel.error = error;
        return responseModel;
      }

      debugPrint(">>>> Data: $data");
      responseModel.isSucessful = true;
      responseModel.data = data;
      responseModel.message = message;
      return responseModel;
    } else {
      responseModel.isSucessful = false;
      responseModel.error = "Something went wrong";
      return responseModel;
    }
  }
}
