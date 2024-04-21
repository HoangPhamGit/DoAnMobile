import 'dart:async';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/forgot_password/notifier/enter_phone_number_notifier.dart';
import 'package:app/modules/forgot_password/notifier/fogot_change_notifier.dart';
import 'package:app/modules/forgot_password/page/page1_forgot_password.dart';
import 'package:app/modules/forgot_password/page/page2_change_password.dart';
import 'package:app/modules/forgot_password/widgets/button_forgot_password.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static Widget create() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ForgotpasswordChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => EnterPhoneNumberChangNotifier(),
        ),
      ],
      child: const ForgotPasswordScreen(),
    );
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  late final TextEditingController passwordController;
  late final TextEditingController otpTextController;
  late ForgotpasswordChangeNotifier _notifier;
  late final StreamController<ErrorAnimationType> errorController;
  bool isTextFieldFilled = false;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    otpTextController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
    _notifier = context.read<ForgotpasswordChangeNotifier>();
    _notifier.tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8 - 30,
                child: TabBarView(
                  controller: _notifier.tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [Page1(), Page2()],
                ),
              ),
              const Spacer(),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                  child: ButtonFogotPassword(
                    onpressed: () {
                      if (_notifier.tabController.index == 0) {
                        final nprovider =
                            Provider.of<EnterPhoneNumberChangNotifier>(context,
                                listen: false);
                        nprovider.onSubmit(context, onSuccess: () {});
                      }
                      _notifier.onNextPage(onStart: () {
                        print('object');
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutesConst.reLogin, (route) => false);
                      });
                    },
                    buttonText: 'forgot-password.continue'.tr(),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
