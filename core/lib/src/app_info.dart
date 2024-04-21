import 'package:injectable/injectable.dart';
import 'package:package_info/package_info.dart';

@lazySingleton
class AppInfo {
  PackageInfo? _packageInfo;
  Future<PackageInfo?> get packageInfo async {
    _packageInfo ??= await PackageInfo.fromPlatform();
    return _packageInfo;
  }

  Future<String?> get versionApp async {
    return (await packageInfo)?.version;
  }

  Future<String?> get buildNumber async {
    return (await packageInfo)?.buildNumber;
  }
}
