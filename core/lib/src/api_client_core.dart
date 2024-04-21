import 'dart:convert';
import 'package:core/core.dart';
import 'package:core/src/auth/auth.dart';
import 'package:core/src/device_info.dart';
// import 'package:core/src/device_info.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'base/request_base.dart';

// import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class ApiClientCore {
  final int _timeOut = 30000; //30 s
  late Dio _dio;
  DioCacheManager? _dioCacheManager;
  final Map<String, Authentication> _authentications = {};
  String? baseUrl;
  // final DeviceInfo _deviceInfo = locator<DeviceInfo>();
  String? cookie;
  String? _languageCode;
  String? get languageCode => _languageCode;

  List<String> allowedSHAFingerprints = [];
  DioCacheManager? get dioCacheManager {
    _dioCacheManager ??= DioCacheManager(CacheConfig(baseUrl: baseUrl));
    return _dioCacheManager;
  }

  ApiClientCore() {
    _authentications[AuthNameConst.oAuth] = OAuth();
    _authentications[AuthNameConst.basic] = HttpBasicAuth();
  }

  final Map<String, String> _defaultHeaderMap = {};

  Future<Response> invokeAPI(
      String path,
      String method,
      Iterable<QueryParam> queryParams,
      Object? body,
      Map<String, String?> headerParams,
      Map<String, String> formParams,
      String contentType,
      List<String> authNames,
      {Options? cacheOptions}) async {
    //var connectionStatus = await locator<FConnectivityPlus>().connectionStatus;
    //if (connectionStatus == ConnectivityResult.none) throw NetworkException();

    _updateParamsForAuth(authNames, headerParams);
    //if (isDeviceInfo) headerParams.addAll(await _getDeviceInfo());
    var ps = queryParams.map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ? '?${ps.join('&')}' : '';

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    //headerParams['cookie'] = globals.cookie;

    BaseOptions options =
        BaseOptions(connectTimeout: _timeOut, receiveTimeout: _timeOut);
    options.baseUrl = baseUrl!;
    options.headers = headerParams;
    _dio = Dio(options);
    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    // if (_baseUrl!.startsWith("https") &&
    //     this.allowedSHAFingerprints.length > 0) {
    //   _dio.interceptors.add(CertificatePinningInterceptor(
    //       allowedSHAFingerprints: allowedSHAFingerprints));
    // }

    _dio.interceptors.add(dioCacheManager!.interceptor);

    String pathApi = path + queryString;
    Object? msgBody;
    // if (_deviceInfo!.deviceType != "IOS") {
    //   if (formDatas != null) {
    //     FormData formData = formDatas;
    //     msgBody = formData;
    //   } else {
    //     msgBody = contentType == "application/x-www-form-urlencoded"
    //         ? formParams
    //         : serialize(body);
    //   }
    // } else {

    RequestBase request = RequestBase();
    request.baseData = await _buildBaseData();
    request.buzzData = body;

    switch (contentType) {
      case "application/x-www-form-urlencoded":
        msgBody = formParams;
        break;
      case 'text/xml;charset=UTF-8':
        msgBody = body;
        break;
      default:
        msgBody = serialize(request);
    }

    //}
    switch (method) {
      case "POST":
        return _dio.post(pathApi, data: msgBody);
      case "PUT":
        return _dio.put(pathApi, data: msgBody);
      case "DELETE":
        return _dio.delete(
          pathApi,
          data: msgBody,
        );
      case "PATCH":
        return _dio.patch(pathApi, data: msgBody);
      default:
        return _dio.get(pathApi);
    }
  }

  Future<BaseData> _buildBaseData() async {
    ///
    final DeviceInfo deviceInfo = locator<DeviceInfo>();
    final RequestDeviceInfo requestDeviceInfo = RequestDeviceInfo();
    requestDeviceInfo.deviceid = await deviceInfo.deviceId;
    requestDeviceInfo.os = deviceInfo.deviceType;
    requestDeviceInfo.osversion = await deviceInfo.osVersion;
    requestDeviceInfo.devicename = await deviceInfo.deviceName;

    ///
    ///

    DateTime now = DateTime.now();
    String requestTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    return BaseData()
      ..language = languageCode
      ..requestid = const Uuid().v1()
      ..requesttime = DateTime.now().millisecondsSinceEpoch.toString()
      ..requesttime = requestTime
      ..deviceInfo = requestDeviceInfo;
  }

  Future<Response> deleteWithBody(
    String path,
    Iterable<QueryParam> queryParams,
    Object body,
    Map<String, String> headerParams,
    String contentType,
    List<String> authNames, {
    bool isDeviceInfo = false,
  }) async {
    _updateParamsForAuth(authNames, headerParams);
    // if (isDeviceInfo) headerParams.addAll(await _getDeviceInfo());
    var ps = queryParams.map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ? '?' + ps.join('&') : '';

    String url = path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;
    //headerParams['cookie'] = globals.cookie;
    BaseOptions options =
        BaseOptions(connectTimeout: _timeOut, receiveTimeout: _timeOut);
    options.baseUrl = baseUrl!;
    options.headers = headerParams;
    _dio = Dio(options);

    var response = await _dio
        .deleteUri(Uri.parse(url), data: serialize(body))
        .timeout(Duration(milliseconds: _timeOut));
    return response;
  }

  String serialize(Object? obj) {
    String serialized = '';

    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(
      List<String> authNames, Map<String, String?> headerParams) {
    for (var authName in authNames) {
      Authentication? auth = _authentications[authName];
      auth?.applyToParams(headerParams);
    }
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      }
    });
  }

  void setBasicAuth(String username, String password) {
    _authentications.forEach((key, auth) {
      if (auth is HttpBasicAuth) {
        auth.setUsernamePassword(username, password);
      }
    });
  }

  void updateBaseUrl(String value) {
    baseUrl = value;
  }

  void updateLanguage(String value) {
    _languageCode = value;
  }

  String? getAccessToken() {
    for (var auth in _authentications.values) {
      if (auth is OAuth) {
        return auth.accessToken;
      }
    }
    return null;
  }
}

class QueryParam {
  String name;
  String value;
  QueryParam(this.name, this.value);
}
