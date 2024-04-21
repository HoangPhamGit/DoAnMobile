part of swagger.api;

class ForgotPasswordResponse {
  String? globalId;
  bool? needconfirmotp;

  ForgotPasswordResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    globalId = json['p_globalid'];
    needconfirmotp = json['p_needconfirmotp'];
  }
}
