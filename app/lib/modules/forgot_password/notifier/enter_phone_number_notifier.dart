import 'package:app/modules/forgot_password/widgets/otp_forgot.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterPhoneNumberChangNotifier with ChangeNotifier {
  final TextEditingController phoneNumberController = TextEditingController();
  String? get phoneNumber => phoneNumberController.text;
  final GlobalKey<FormState> formKey = GlobalKey();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final TextEditingController otpController = TextEditingController();
  String? get otp => otpController.text;
  bool check = false;
  bool hasError = false;
  String? checkPhoneNumber() {
    if ((phoneNumber ?? '').isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    return null;
  }

  ForgotPasswordRequest request() {
    return ForgotPasswordRequest(phoneNumber);
  }

  ForgotPasswordRequest? forgotPasswordRequest;
  ForgotPasswordResponse? forgotPassword;

  Future<void> loadForgot(String? mobile) async {
    final accountApi = locator<AccountApi>();
    var response = await accountApi.getforgotPassword(request());
    forgotPassword = response;
    // print('mobile: ${forgotPasswordRequest!.mobile}');
    notifyListeners();
  }

  Future<void> loadOTP(String otp) async {
    final accountApi = locator<AccountApi>();
    await accountApi.confirmOTP(otp);
    notifyListeners();
  }

  void onSubmit(BuildContext context, {required Function onSuccess}) {
    if (!formKey.currentState!.validate()) {
      if ((checkPhoneNumber() ?? '').isNotEmpty) {
        phoneNumberFocusNode.requestFocus();
      }
      return;
    }
    loadForgot(phoneNumber).then(
      (value) {
        if (forgotPassword!.needconfirmotp! == true) {
          print('Phone Nyumber');
          print(phoneNumber);
          final provider = Provider.of<EnterPhoneNumberChangNotifier>(context,
              listen: false);
          showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24))),
              context: context,
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.8,
                  child: OTPForgotPassword(
                    check: check,
                    phoneNumber: provider.phoneNumber,
                    oncompleted: (value) {
                      loadOTP(otp ?? '').then((value) {
                        check = true;
                        Navigator.pop(context);
                      });
                    },
                  ),
                );
              });
        }
      },
    );
  }
}
