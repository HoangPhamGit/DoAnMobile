import 'package:data/data.dart';
import 'app_config_const.dart';

class AppConfig {
  Environment environment;
  late Map<String, dynamic> _config;

  String? get baseUrl => _config[AppConfigConst.baseUrl];
  AppConfig(this.environment) {
    environment = environment;
    switch (environment) {
      case Environment.test:
        _config = _Config.testConstants;
        break;
      case Environment.uat:
        _config = _Config.uatConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }
}

class _Config {
  ///Environment
  static Map<String, dynamic> testConstants = {
    AppConfigConst.baseUrl: 'http://192.168.26.92',
  };

  static Map<String, dynamic> uatConstants = {
    AppConfigConst.baseUrl: 'http://192.168.26.92',
  };

  static Map<String, dynamic> prodConstants = {
    AppConfigConst.baseUrl: 'http://192.168.26.92',
  };
}
