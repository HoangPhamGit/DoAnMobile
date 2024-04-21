part of swagger.api;

class KycInitResponse {
  String? globalid;

  KycInitResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    globalid = json['p_globalid'];
  }
}
