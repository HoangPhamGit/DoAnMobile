import 'package:flutter/material.dart';

class EnteruserNameChangeNotifier with ChangeNotifier {
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode usernameFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController userNameController = TextEditingController();
  String? get userName => userNameController.text;

  String? checkUserInput() {
    if ((userName ?? '').isEmpty) {
      return 'Vui long nhap ho va ten cua ban';
    } else if (userName!.contains(RegExp(r'[0-9]'))) {
      return 'Ho ten khong the chua chu so';
    } else if (userName!.length <= 5) {
      return 'Vui long nhap du ho va ten';
    }
    return null;
  }

  void onSubmit(BuildContext context, {required Function onSuccess}) {
    if (!formKey.currentState!.validate()) {
      if ((checkUserInput() ?? '').isNotEmpty) {
        usernameFocus.requestFocus();
      }
      return;
    }
    onSuccess();
  }
}
