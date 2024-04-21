library swagger.api;

import 'package:core/core.dart';
import 'package:data/src/datasource/remote/api_request_uri.dart';
import 'package:domain/domain.dart';
import 'example_response.dart';

//API
part 'api/account_api.dart';
part 'api/kyc_api.dart';
part 'api/service_api.dart';

//Request
part 'request/create_customner_confirm_request.dart';
part 'request/forgot_password_request.dart';
part 'request/kyc/kyc_init_request.dart';
part 'request/kyc/kyc_upload_request.dart';
//Response
part 'response/customer_response.dart';
part 'response/create_customer_respone.dart';
part 'response/forgot_password_response.dart';
part 'response/list_all_services_response.dart';
part 'response/image_response.dart';
part 'response/kyc/kyc_init_response.dart';
part 'response/kyc/kyc_upload_response.dart';
