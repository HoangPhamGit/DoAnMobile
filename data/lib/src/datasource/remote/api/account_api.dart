part of swagger.api;

abstract class AccountApi {
  final ApiClient apiClient;

  AccountApi([ApiClient? apiClient])
      : apiClient = apiClient ?? locator<ApiClient>();

  ///Lay thong tin tai khoan
  Future<CustomerResponse?> getCustomer();

  /// dang ky tai khoan
  /// dang ky tai khoan
  Future<CreateCustomerRespone?> getCreateCustom(String mobile);

  /// confirm OTP
  Future<void> confirmOTP(String otpCode);

  /// confirm create customer

  Future<void> createCustomerConfirm(CreateCustomerConfirm customer);

  // forgotPassword
  Future<ForgotPasswordResponse?> getforgotPassword(
      ForgotPasswordRequest? body);
}

class AccountApiImpl extends AccountApi {
  @override
  Future<CustomerResponse?> getCustomer() async {
    Object? body;
    String path = ApiRequestUri.getCustomer;

    ///
    dynamic responseExample = await ExampleResponse.instance.getResponse(path);
    if (responseExample != null) {
      dynamic data = apiClient.validateExample(responseExample);

      return CustomerResponse.fromJson(data);
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
      return CustomerResponse.fromJson(data);
    } else {
      return null;
    }
  }

  /// create customer
  @override
  Future<CreateCustomerRespone?> getCreateCustom(String mobile) async {
    Object? body = {"p_mobile": mobile};
    String path = ApiRequestUri.createCustomer;
    dynamic responseExample = await ExampleResponse.instance.getResponse(path);
    if (responseExample != null) {
      dynamic data = apiClient.validateExample(responseExample);

      return CreateCustomerRespone.fromJson(data);
    }

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
      return CreateCustomerRespone.fromJson(data);
    } else {
      return null;
    }
  }

  /// confirm  otp
  @override
  Future<void> confirmOTP(String otpCode) async {
    Object? body = {"p_otp": otpCode};
    String path = ApiRequestUri.confirmOTP;

    dynamic responseExample = await ExampleResponse.instance.getResponse(path);

    if (responseExample != null) {
      apiClient.validateExample(responseExample);

      return;
    }

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
      apiClient.validate(response);
    } else {
      return;
    }
  }

  /// create customer confirm
  @override
  Future<void> createCustomerConfirm(CreateCustomerConfirm customer) async {
    Object? body = customer;
    String path = ApiRequestUri.createCusConfirm;
    dynamic responseExample = await ExampleResponse.instance.getResponse(path);

    if (responseExample != null) {
      apiClient.validateExample(responseExample);
      return;
    }
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    List<String> contentTypes = [];
    String contentType =
        contentTypes.isNotEmpty ? contentTypes[0] : 'application/json';
    List<String> authNames = [AuthNameConst.oAuth];
    var response = await apiClient.invokeAPI(path, 'POST', queryParams, body,
        headerParams, formParams, contentType, authNames);
    if (response.data != null) {
      apiClient.validate(response);
    } else {
      return;
    }
  }

  //ForgotPassword
  @override
  Future<ForgotPasswordResponse?> getforgotPassword(
      ForgotPasswordRequest? request) async {
    Object? body = request;
    String path = ApiRequestUri.forgotPassword;
    dynamic responseExample = await ExampleResponse.instance.getResponse(path);
    if (responseExample != null) {
      dynamic data = apiClient.validateExample(responseExample);
      print(data);
      return ForgotPasswordResponse.fromJson(data);
    }

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
      return ForgotPasswordResponse.fromJson(data);
    } else {
      return null;
    }
  }
}
