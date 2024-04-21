part of swagger.api;

class ImageResponse {
  String? defaulturl;
  String? hdpiurl;
  String? mdpiurl;
  String? ldpiurl;
  ImageResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    defaulturl = json["p_defaulturl"];
    hdpiurl = json["p_hdpiurl"];
    mdpiurl = json["p_mdpiurl"];
    ldpiurl = json["p_ldpiurl"];
  }
}
