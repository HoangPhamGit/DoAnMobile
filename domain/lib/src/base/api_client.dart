import 'package:core/core.dart';

abstract class ApiClient extends ApiClientCore {
  dynamic validate(Response response);

  dynamic validateExample(Map<String, dynamic> data);
}
