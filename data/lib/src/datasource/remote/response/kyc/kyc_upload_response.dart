part of swagger.api;

class KycUploadResponse {
  String? globalid;
  // ignore: library_private_types_in_public_api
  _EkycResult? ekycResult;
  // ignore: library_private_types_in_public_api
  _ListConfidences? listConfidence;
  String? idType;
  String? idCode;
  String? fullName;
  String? birthDate;
  String? sex;
  String? idDate;
  String? idExpandated;
  String? idPlace;
  String? national;
  // ignore: library_private_types_in_public_api
  _PermanentAddress? permanentAddress;
  String? minConfidence;

  KycUploadResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    globalid = json['p_globalid'];
    ekycResult = _EkycResult.fromJson(json['p_ekyc_result']);
    listConfidence = _ListConfidences.fromJson(json['p_list_confidences']);
    idType = json['p_idtype'];
    idCode = json['p_idcode'];
    fullName = json['p_fullname'];
    birthDate = json['p_birthdate'];
    sex = json['p_sex'];
    idDate = json['p_iddate'];
    idExpandated = json['p_idexpdated'];
    idPlace = json['p_idplace'];
    national = json['p_national'];
    permanentAddress = _PermanentAddress.fromJson(json['p_permanent_address']);
    minConfidence = json['p_min_confidence'];
  }
}

class _EkycResult {
  int? resultCode;
  String? resultMessage;
  _EkycResult.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    resultCode = json['p_result_code'];
    resultMessage = json['p_result_message'];
  }
}

class _ListConfidences {
  String? readdressConfidence;
  String? birthdateConfidence;
  String? countryConfidence;
  String? idCodeConfidence;
  String? idDateConfidence;
  String? idExpandatedConfidence;
  String? fullNameConfidence;
  String? sexConfidence;

  _ListConfidences.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    readdressConfidence = json['p_regaddress_confidence'];
    birthdateConfidence = json['p_birthdate_confidence'];
    countryConfidence = json['p_country_confidence'];
    idCodeConfidence = json['p_idcode_confidence'];
    idDateConfidence = json['p_iddate_confidence'];
    idExpandatedConfidence = json['p_idexpdated_confidence'];
    fullNameConfidence = json['p_fullname_confidence'];
    sexConfidence = json['p_sex_confidence'];
  }
}
