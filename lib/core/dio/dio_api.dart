import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiResponse<T> {
  late T load;
  late bool ok;
  late int statusCode;
  String? errorMessage;

  ApiResponse(this.statusCode, this.load, [bool? isOk]) {
    this.ok = isOk ?? statusCode == 200;
  }

  ApiResponse.fromBC(APIResponse<T> bcresp) {
    if (bcresp.load != null) {
      load = bcresp.load!;
    } else {
      errorMessage = bcresp.error?.message;
    }
    statusCode = bcresp.statusCode!;
    ok = bcresp.ok ?? statusCode == 200;
  }
}

class RequestResult {
  dynamic json;
  int? statusCode;
  RequestResult(this.json, this.statusCode);
}

abstract class ApiBase {
  late String endpoint;

  final Dio _dio = Dio();

  Future<RequestResult> request({
    required String method,
    required String path,
    required Map<String, String> headers,
    dynamic body,
    bool customPath = false,
  }) async {
    //APIStatus connStatus = await checkConnection();
    //if (connStatus == APIStatus.ConnectionReady) {

    path = customPath ? endpoint : path;
    Response? resp;
    dynamic decodedJson;
    try {
      switch (method) {
        case 'post':
          resp = await _dio.post(path, data: body, queryParameters: headers);
          break;
        case 'get':
          resp = await _dio.get(path, queryParameters: headers);
          break;
        case 'delete':
          resp = await _dio.delete(path, queryParameters: headers);
      }

      decodedJson = resp!.data;
    } catch (e, st) {
      log("""HTTP Request error: 
            statusCode: ${resp?.statusCode}
            body: ${resp?.data}
            exception: $e
            stackTrace: $st
            """);

      decodedJson = Map.from(<String, dynamic>{});
    }
    return RequestResult(decodedJson, resp?.statusCode);
  }

  Future<RequestResult> post(String path,
      {Map<String, String> headers = const {},
      dynamic body = '',
      bool customPath = false}) async {
    headers = Map<String, String>.from(headers);
    headers['Content-Type'] = 'Application/json; charset=utf-8';
    return request(
        method: 'post',
        path: path,
        headers: headers,
        body: body,
        customPath: customPath);
  }

  Future<RequestResult> get(String path,
      {Map<String, String> headers = const {}, bool customPath = false}) async {
    return request(
        method: 'get', path: path, headers: headers, customPath: customPath);
  }
}

enum APIStatus {
  Success,
  ConnectionReady,
  TransferError,
  AuthError,
  ServerError,
  ConnectionError,
  ServerConnectionError,
  UnexpectedError,
  EmptyAccount
}

Map<int, APIStatus> statusCodes = {
  200: APIStatus.Success,
  401: APIStatus.AuthError,
  500: APIStatus.ServerError,
  0: APIStatus.UnexpectedError
};

class APIResponse<DataModel_T> {
  int? statusCode;
  DataModel_T? load;
  Error? error;
  bool? ok;
  APIResponse(this.statusCode, DataModel_T load) {
    ok = statusCode == 200;

    if (statusCode == 200) {
      this.load = load;
    } else {
      this.load = <String, dynamic>{} as DataModel_T;
      var load_ = load as Map;
      try {
        error = Error(
            code: statusCode,
            message: (load_['message'] as String?) != null
                ? load_['message']
                : load.toString());
      } catch (_) {}
    }
  }

  APIResponse.fromOther(APIResponse other) {
    statusCode = other.statusCode;
    load = other.load;
    error = other.error;
    ok = other.ok;
  }
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message});
}
