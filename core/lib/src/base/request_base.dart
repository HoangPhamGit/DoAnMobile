class RequestBase {
  BaseData? baseData;
  Object? buzzData;

  Map<String, dynamic> toJson() {
    return {
      "baseData": baseData?.toJson(),
      "buzzData": buzzData,
    };
  }
}

class BaseData {
  String? requestid;
  String? requesttime;
  RequestDeviceInfo? deviceInfo;
  String? location;
  String? language;

  Map<String, dynamic> toJson() {
    return {
      "p_requestid": requestid,
      "p_requesttime": requesttime,
      "p_device": deviceInfo?.toJson(),
      "p_location": location,
      "p_language": language,
    };
  }
}

class RequestDeviceInfo {
  String? devicename;
  String? os;
  String? osversion;
  String? deviceid;

  Map<String, dynamic> toJson() {
    return {
      "p_devicename": devicename,
      "p_os": os,
      "p_osversion": osversion,
      "p_deviceid": deviceid,
    };
  }
}
