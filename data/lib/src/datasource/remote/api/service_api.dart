part of swagger.api;

abstract class ServiceApi {
  final ApiClient apiClient;

  ServiceApi([ApiClient? apiClient])
      : apiClient = apiClient ?? locator<ApiClient>();

  ///Lay danh sach dich vu
  Future<ListAllServicesResponse?> listAllServices();
}

class ServiceApiImpl extends ServiceApi {
  @override
  Future<ListAllServicesResponse?> listAllServices() async {
    Object? body;
    String path = ApiRequestUri.listAllServices;

    ///
    dynamic responseExample = await ExampleResponse.instance.getResponse(path);
    if (responseExample != null) {
      dynamic data = apiClient.validateExample(responseExample);
      return ListAllServicesResponse.fromJson(data);
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
      return ListAllServicesResponse.fromJson(data);
    } else {
      return null;
    }
  }
}
