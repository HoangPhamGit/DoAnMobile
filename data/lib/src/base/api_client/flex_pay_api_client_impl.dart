import 'package:core/core.dart';
import 'package:domain/domain.dart';

class FlexPayApiClientImpl extends ApiClient {
  @override
  validate(Response response) {
    throw UnimplementedError();
  }

  @override
  validateExample(Map<String, dynamic> data) {
    Map<String, dynamic> json = data;
    String? errCode;
    String? errMessage;
    Map<String, dynamic> baseData = json["baseData"];
    dynamic extendData = json["extendData"];

    if (baseData.containsKey("p_err_code")) {
      errCode = baseData["p_err_code"].toString().toUpperCase();
    }
    if (baseData.containsKey("p_err_message")) {
      errMessage = baseData["p_err_message"].toString();
    }
    if (errCode != null && errCode == "0") {
      return extendData;
    } else {
      throw ApiException(
        errorCode: errCode ?? '?',
        errorMessage: errMessage,
        data: data,
      );
    }
  }
}
