import 'package:app/components/components.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/register/notifiers/create_password_change_notifier.dart';
import 'package:app/modules/register/notifiers/phone_number_registration_change_notifier.dart';
import 'package:app/modules/register/notifiers/user_name_enter_change_notifier.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterChangeNotifier with ChangeNotifier {
  final LoadingTextButtonController buttonController =
      LoadingTextButtonController();
  late TabController tabController;
  int get index => tabController.index;
  bool isClickAble = false;

  void onNextPage({Function? onStart}) {
    if (index != tabController.length - 1) {
      int nextIndex = index + 1;
      tabController.animateTo(nextIndex);
      notifyListeners();
    } else {
      if (onStart != null) onStart();
    }
  }

  void onPreviousPage() {
    if (index > 0) {
      int prevIndex = index - 1;
      tabController.animateTo(prevIndex);
      notifyListeners();
    }
  }

  void onSubmit(BuildContext context) {
    switch (index) {
      case 0:
        buttonController.start();
        context.read<PhoneNumberRegistrationChangeNotifier>().onSubmit(context,
            onSuccess: () {
          buttonController.success();
          onNextPage();
        }, onError: () {
          buttonController.stop();
        });
        break;
      case 1:
        context.read<EnteruserNameChangeNotifier>().onSubmit(context,
            onSuccess: () {
          onNextPage();
        });
        break;
      case 2:
        getUserInfo(context);
        context.read<CreatePasswordChangeNotifier>().onSubmit(context,
            onSuccess: () {
          onNextPage(onStart: () {
            Navigator.pushNamed(context, AppRoutesConst.successRegister);
          });
        });

        break;
      default:
        onNextPage(onStart: () {
          Navigator.pushNamed(context, AppRoutesConst.successRegister);
        });
        break;
    }
  }

  CreateCustomerConfirm getUserInfo(BuildContext context) {
    return CreateCustomerConfirm(
        fullName: context.read<EnteruserNameChangeNotifier>().userName,
        useName:
            context.read<PhoneNumberRegistrationChangeNotifier>().phoneNumber,
        passWord: context.read<CreatePasswordChangeNotifier>().pass);
  }
}
