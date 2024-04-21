import 'package:app/commons/message_manager.dart';
import 'package:app/components/components.dart';
import 'package:app/modules/register/register_change_notifier.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/otp_code.dart';

class PhoneNumberRegistrationChangeNotifier with ChangeNotifier {
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();
  String? get phoneNumber => phoneNumberController.text;

  final GlobalKey<FormState> formKey = GlobalKey();
  bool isDone = false;
  bool isAgreeTerm = false;

  CreateCustomerRespone? createCustomer;

  Future<void> loadCreateCustomer(String phoneNumber) async {
    final accountApi = locator<AccountApi>();
    var response = await accountApi.getCreateCustom(phoneNumber);

    createCustomer = response;
    notifyListeners();
  }

  Future<void> confirmOTP(String otp) async {
    final accountApi = locator<AccountApi>();
    await accountApi.confirmOTP(otp);
    notifyListeners();
  }

  void checkTerm(value) {
    isAgreeTerm = value;
    notifyListeners();
  }

  String? validatePhoneNumber(BuildContext context) {
    if ((phoneNumber ?? '').isEmpty) {
      return 'Dữ liệu không được trống!'.tr();
    } else if (phoneNumber![0] != '0') {
      return 'Vui long nhap dung dinh dang SDT';
    }
    buttonOff(context.read<RegisterChangeNotifier>().buttonController);

    ///vali dung so dien thoai
    return null;
  }

  void buttonOn(LoadingTextButtonController btnController) {
    btnController.start();
  }

  void buttonOff(LoadingTextButtonController btnController) {
    btnController.success();
  }

  void onSubmit(BuildContext context,
      {required Function onSuccess, required Function onError}) {
    if (!formKey.currentState!.validate()) {
      if ((validatePhoneNumber(context) ?? '').isNotEmpty) {
        phoneNumberFocusNode.requestFocus();
        onError();
      }
      return;
    }

    if (isAgreeTerm) {
      loadCreateCustomer(phoneNumber!).then((value) {
        if (createCustomer!.needConfirmotp!) {
          final provider = Provider.of<PhoneNumberRegistrationChangeNotifier>(
              context,
              listen: false);

          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24))),
              builder: (context) {
                return ListenableProvider.value(
                  value: provider,
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    child: buildOTp(context, 30,
                        provider.phoneNumber ?? '123123', provider),
                  ),
                );
              }).then((item) {
            if (isDone) {
              onSuccess();
            }
          });
        }
      }).onError((error, stackTrace) {
        //
        onError();
        MessageManager.onErrorDialog(context, error);
      });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                  height: 80,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: const Text(
                    'Vui long dong ý với điều khoản sử dụng',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        decoration: TextDecoration.none),
                  )),
            );
          });
    }
  }
}
