import 'package:app/configs/configs.dart';
import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

export 'app_config/app_config.dart';
export 'routes/app_routes.dart';
export 'routes/arguments.dart';

final _locator = GetIt.instance..allowReassignment = true;

class Configs {
  static Future<void> init(Environment environment) async {
    _locator.registerSingleton<AppConfig>(AppConfig(environment));
  }
}
