part of swagger.api;

class CustomerResponse {
  String? custid;
  String? firstname;
  String? middlename;
  String? lastname;
  String? fullname;
  String? shortname;
  String? mobile;
  String? sex;
  String? birthdate;
  // ignore: library_private_types_in_public_api
  _CurrentAddress? currentAddress;
  String? job;
  String? status;
  String? kycstatus;
  String? email;
  // ignore: library_private_types_in_public_api
  ImageResponse? avatar;
  // ignore: library_private_types_in_public_api
  _IdeKYC? idkyc;

  CustomerResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    custid = json["p_custid"];
    firstname = json["p_firstname"];
    middlename = json["p_middlename"];
    lastname = json["p_lastname"];
    fullname = json["p_fullname"];
    shortname = json["p_shortname"];
    mobile = json["p_mobile"];
    sex = json["p_sex"];
    birthdate = json["p_birthdate"];
    currentAddress = _CurrentAddress.fromJson(json["p_current_address"]);
    job = json["p_job"];
    status = json["p_status"];
    kycstatus = json["p_kycstatus"];
    email = json["p_email"];
    avatar = ImageResponse.fromJson(json["p_avatar"]);
    idkyc = _IdeKYC.fromJson(json["p_idkyc"]);
  }
}

class _CurrentAddress {
  String? country;
  String? province;
  String? district;
  String? ward;
  String? addressDetail;

  _CurrentAddress.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    country = json["p_country"];
    province = json["p_province"];
    district = json["p_district"];
    ward = json["p_ward"];
    addressDetail = json["p_address_detail"];
  }
}

class _IdeKYC {
  String? idtype;
  String? idcode;
  String? iddate;
  String? idexpdated;
  String? national;
  String? idplace;
  _PermanentAddress? permanentAddress;
  String? status;
  String? ekyclvl;

  _IdeKYC.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    idtype = json["p_idtype"];
    idcode = json["p_idcode"];
    iddate = json["p_iddate"];
    idexpdated = json["p_idexpdated"];
    national = json["p_national"];
    idplace = json["p_idplace"];
    permanentAddress = _PermanentAddress.fromJson(json["p_permanent_address"]);
    status = json["p_status"];
    ekyclvl = json["p_ekyc_lvl"];
  }
}

class _PermanentAddress {
  String? country;
  String? province;
  String? district;
  String? ward;
  String? addressDetail;
  _PermanentAddress.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    country = json["p_country"];
    province = json["p_province"];
    district = json["p_district"];
    ward = json["p_ward"];
    addressDetail = json["p_address_detail"];
  }
}
