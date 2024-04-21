import 'dart:convert';

import 'package:data/src/datasource/remote/api_request_uri.dart';
import 'package:flutter/services.dart' show rootBundle;

class ExampleResponse {
  static final ExampleResponse _instance = ExampleResponse();
  static ExampleResponse get instance {
    return _instance;
  }

  final Map<String, String> _mapExample = {
    ApiRequestUri.forgotPassword: "forgotPassword_mi.json",
    ApiRequestUri.getCustomer: "getCustomer.json",
    ApiRequestUri.createCustomer: 'createCustomer.json',
    ApiRequestUri.confirmOTP: 'confirmOTP.json',
    ApiRequestUri.createCusConfirm: 'createCustomerConfirm.json',
    ApiRequestUri.kycInit: 'kycInit.json',
    ApiRequestUri.kycUpload: 'kycUpload.json',
    ApiRequestUri.listAllServices: 'listAllServices.json',
  };

  Future<dynamic> getResponse(String apiUri) async {
    String? filename = _mapExample[apiUri];
    if (filename != null) {
      String filePath = "packages/data/assets/example/response/$filename";
      String? str = await rootBundle.loadString(filePath);
      return json.decode(str);
    }
    return null;
  }
}
