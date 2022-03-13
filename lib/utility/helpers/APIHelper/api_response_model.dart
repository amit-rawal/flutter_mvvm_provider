///This is generic response data model please modify it according to your API Structure.
///Model is designed to be generic please keep it that way
///Things to change:
///              1. Change data section - key where your data is.
///              2. Error and Messages -  key where your error, errors and message are.
///              3. okAndContainsData Condition - Change logic according to your API Structure
///

class Success {
  int statusCode;
  Object response;
  Success({required this.statusCode, required this.response});
}

class Failure {
  int statusCode;
  Object errorResponse;
  Failure({required this.statusCode, required this.errorResponse});
}

// class ResponseData {
//   int? statusCode;
//   bool ok;
//   bool okAndContainsData;
//   var data;
//   String? message;
//   ResponseErrors? errors;
//   String? rawResponseBody;
//
//   ResponseData(
//       {this.statusCode,
//       this.data,
//       this.message,
//       this.errors,
//       this.ok = false,
//       this.okAndContainsData = false,
//       this.rawResponseBody});
//
//   factory ResponseData.fromResponse(http.Response response,
//       {bool useBodyAsData = false}) {
//     var parsedJson = jsonDecode(response.body);
//     //debugPrint("ResponseData.fromResponse = $parsedJson");
//
//     return ResponseData(
//       statusCode: response.statusCode,
//       ok: (response.statusCode == 200 ||
//           response.statusCode == 201 ||
//           response.statusCode == 204),
//       data: useBodyAsData ? parsedJson : parsedJson['data'],
//       rawResponseBody: response.body,
//       okAndContainsData: (response.statusCode == 200 ||
//               response.statusCode == 201 ||
//               response.statusCode == 204) &&
//           (useBodyAsData ? true : parsedJson['data'] != null),
//       message: useBodyAsData ? null : parsedJson['message'] ?? "",
//       errors: useBodyAsData
//           ? null
//           : parsedJson['errors'] != null
//               ? parsedJson['errors'].runtimeType == String
//                   ? ResponseErrors(message: parsedJson['errors'])
//                   : ResponseErrors.fromJson(parsedJson['errors'])
//               : parsedJson['error'] != null
//                   ? ResponseErrors(message: parsedJson['error'])
//                   : null,
//     );
//   }
// }
//
// class ResponseErrors {
//   String message;
//
//   ResponseErrors({
//     required this.message,
//   });
//
//   factory ResponseErrors.fromJson(Map<String, dynamic> parsedJson) {
//     return ResponseErrors(
//       message: parsedJson['message'] ?? "",
//     );
//   }
// }
