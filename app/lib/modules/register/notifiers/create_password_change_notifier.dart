import 'package:app/commons/message_manager.dart';
import 'package:app/modules/register/register_change_notifier.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePasswordChangeNotifier with ChangeNotifier {
  final FocusNode passwordFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController passController = TextEditingController();
  String get pass => passController.text;
  TextEditingController rePassController = TextEditingController();
  String get rePass => rePassController.text;

  bool isShowPass = false;
  bool isShowRePass = false;

  bool showPass() {
    isShowPass = !isShowPass;
    notifyListeners();
    return isShowPass;
  }

  bool showRepass() {
    isShowRePass = !isShowRePass;
    notifyListeners();
    return isShowRePass;
  }

  CreateCustomerConfirm? customerConfirm;
  Future<void> confirmCustomer(CreateCustomerConfirm customerConfirm) async {
    final accountApi = locator<AccountApi>();
    await accountApi.createCustomerConfirm(customerConfirm);
    notifyListeners();
  }

  String? checkPass() {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{10,}$');
    if (pass.isEmpty) {
      return 'Vui long nhap mat khau';
    } else if (!regex.hasMatch(pass)) {
      return 'Vui long nhap dung dinh dang mat khau';
    }
    return null;
  }

  String? checkRePass() {
    if (rePass != pass) {
      return 'Mat khau khong khop';
    }
    return null;
  }

  void onSubmit(BuildContext context, {required Function onSuccess}) {
    if (!formKey.currentState!.validate()) {
      if ((checkPass() ?? '').isNotEmpty || (checkRePass() ?? '').isNotEmpty) {
        passwordFocus.requestFocus();
      }
      return;
    }

    confirmCustomer(context.read<RegisterChangeNotifier>().getUserInfo(context))
        .then((value) {
      onSuccess();
    }).onError((error, stackTrace) {
      //

      MessageManager.onErrorDialog(context, error);
    });
  }
}
