import 'package:app/modules/forgot_password/widgets/forgot_password_page.dart';
import 'package:app/modules/forgot_password/widgets/forgot_password_text_field.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late final TextEditingController newPasswordController;
  late final TextEditingController enterNewPassWordController;
  // FocusNode focusNodeNewPs = FocusNode();
  // FocusNode focusNodeEnterNewPs = FocusNode();

  // Color borderColornewPS = Colors.grey;
  // BoxShadow boxShadownewPS = const BoxShadow();
  // Color borderColorEnterNewPS = Colors.grey;
  // BoxShadow boxShadowEnterNewPS = const BoxShadow();
  @override
  void initState() {
    newPasswordController = TextEditingController();
    enterNewPassWordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    enterNewPassWordController.dispose();
    newPasswordController.dispose();
    // focusNodeEnterNewPs.dispose();
    // focusNodeNewPs.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordPage(
      password: true,
      title: "forgot-password.title-forgot-password".tr(),
      textBottomTitle: "forgot-password.content".tr(),
      textField: ForgotPasswordTextField(
        controller: newPasswordController,
        hinText: "forgot-password.new-password".tr(),
        password: true,
      ),
      textField2: ForgotPasswordTextField(
        controller: enterNewPassWordController,
        hinText: "forgot-password.enter-new-password".tr(),
        password: true,
      ),
    );
  }
}
