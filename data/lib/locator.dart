import 'package:data/src/base/api_client/flex_pay_api_client_impl.dart';
import 'package:data/src/datasource/remote/api.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

final _locator = GetIt.instance..allowReassignment = true;

void setupLocator() {
  _locator.registerLazySingleton<ApiClient>(() => FlexPayApiClientImpl());
  _locator.registerLazySingleton<AccountApi>(() => AccountApiImpl());
  _locator.registerLazySingleton<XacThucAPI>(() => KycAPIImle());
}
