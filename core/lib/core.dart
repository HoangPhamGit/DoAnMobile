library core;

export 'src/api_client_core.dart';
export 'package:dio/dio.dart';
export 'src/auth/auth_name_const.dart';
export 'src/exception.dart';
export 'package:dio/src/dio_error.dart';
export 'package:http_certificate_pinning/http_certificate_pinning.dart';
import 'package:get_it/get_it.dart';
import 'di/injection.dart' as di;

final locator = GetIt.instance..allowReassignment = true;

class Core {
  static void init() {
    _setupLocator();
  }
}

void _setupLocator() {
  di.configureInjection();
}
