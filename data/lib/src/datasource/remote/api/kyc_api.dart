part of swagger.api;

abstract class XacThucAPI {
  final ApiClient apiClient;
  XacThucAPI([ApiClient? apiClient])
      : apiClient = apiClient ?? locator<ApiClient>();

  Future<KycInitResponse?> kycInit(KycInitRequest request);
  Future<KycUploadResponse?> kycUpload(KycUploadRequest request);
}

class KycAPIImle extends XacThucAPI {
  @override
  Future<KycInitResponse?> kycInit(KycInitRequest request) async {
    Object? body = request;
    String path = ApiRequestUri.kycInit;

    ///
    dynamic responseExample = await ExampleResponse.instance.getResponse(path);
    print(responseExample);
    if (responseExample != null) {
      dynamic data = apiClient.validateExample(responseExample);
      print(" kyc init $data");
      return KycInitResponse.fromJson(data);
    }

    ///
    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];
    String contentType =
        contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    List<String> authNames = [AuthNameConst.oAuth];
    var response = await apiClient.invokeAPI(path, 'POST', queryParams, body,
        headerParams, formParams, contentType, authNames);
    if (response.data != null) {
      var data = apiClient.validate(response);
      return KycInitResponse.fromJson(data);
    } else {
      return null;
    }
  }

  Future<KycUploadResponse?> kycUpload(KycUploadRequest request) async {
    Object? body = request;
    String path = ApiRequestUri.kycUpload;

    // dynamic exampleResponse = await ExampleResponse.instance.getResponse(path);
    // if (exampleResponse != null) {
    //   dynamic data = apiClient.validateExample(exampleResponse);
    //   print('api data ${data}');
    //   return KycUploadResponse.fromJson(data);
    // }
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    List<String> contentTypes = [];
    String contentType =
        contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    List<String> authNames = [AuthNameConst.oAuth];
    var response = await apiClient.invokeAPI(path, "POST", queryParams, body,
        headerParams, formParams, contentType, authNames);
    if (response.data != null) {
      var data = apiClient.validate(response);
      return KycUploadResponse.fromJson(data);
    } else {
      return null;
    }
  }
}
