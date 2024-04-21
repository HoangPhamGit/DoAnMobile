import 'authentication.dart';

class OAuth implements Authentication {
  String? accessToken;

  OAuth({this.accessToken});

  @override
  void applyToParams(Map<String, String?> headerParams) {
    if (accessToken != null) {
      headerParams["Authorization"] = "Bearer " + accessToken!;
    }
  }

  void setAccessToken(String accessToken) {
    this.accessToken = accessToken;
  }
}
