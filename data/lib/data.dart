library data;

import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

import 'src/base/api_client/flex_pay_api_client_impl.dart';
import 'src/datasource/remote/api.dart';
export 'environment.dart';
export 'src/datasource/remote/api.dart';

final _locator = GetIt.instance..allowReassignment = true;

class Data {
  static void init({required String baseUrl}) {
    _setupLocator();
    _locator<ApiClient>().updateBaseUrl(baseUrl);
  }
}

void _setupLocator() {
  _locator.registerLazySingleton<ApiClient>(() => FlexPayApiClientImpl());
  _locator.registerLazySingleton<AccountApi>(() => AccountApiImpl());
  _locator.registerLazySingleton<XacThucAPI>(() => KycAPIImle());
  _locator.registerLazySingleton<ServiceApi>(() => ServiceApiImpl());
}
