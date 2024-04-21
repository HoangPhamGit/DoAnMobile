import 'dart:async';

import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/modules/register/notifiers/create_password_change_notifier.dart';
import 'package:app/modules/register/notifiers/phone_number_registration_change_notifier.dart';
import 'package:app/modules/register/notifiers/user_name_enter_change_notifier.dart';
import 'package:app/modules/register/pages/register_page_create_password.dart';
import 'package:app/modules/register/pages/register_page_enter_username.dart';
import 'package:app/modules/register/register_change_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import 'pages/phone_number_registration_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static Widget create() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PhoneNumberRegistrationChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => EnteruserNameChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreatePasswordChangeNotifier(),
        ),
      ],
      child: const RegisterScreen(),
    );
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  // khi da nhap so dien thoai va dong y dieu khoan

  // click vào điều khoản hợp đồng
  bool isClickTerm = false;
  late final TextEditingController phoneNumberController;
  late final TextEditingController otpTextController;
  late RegisterChangeNotifier _notifier;
  late final StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
    otpTextController = TextEditingController();

    errorController = StreamController<ErrorAnimationType>();
    _notifier = context.read<RegisterChangeNotifier>();
    _notifier.tabController = TabController(length: 3, vsync: this);
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
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: TabBarView(
                    controller: _notifier.tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const <Widget>[
                      // man nhap so dien thoai
                      PhoneNumberRegistrationPage(),
                      // man nhap ten nguoi dung
                      //RegisterPagePhoneNumber(),
                      // man hinh nhap ten nguoi dung
                      RegisterPageUsername(),
                      // man hinh tao mat khau
                      RegisterPageCreatePassword(),
                    ],
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                    child: LoadingTextButton(
                        title: "register.next".tr(),
                        controller: _notifier.buttonController,
                        onPressed: () {
                          _notifier.onSubmit(context);

                          // if (_notifier.tabController.index == 0) {
                          //   buildBottomSheet(
                          //       context: context,
                          //       bottomSheet: const BuildOtpCode(
                          //         phoneNumber: '1213123',
                          //       ),
                          //       size: 0.8);
                          // }
                          // _notifier.onNextPage(onStart: () {
                          //   Navigator.pushNamed(
                          //     context,
                          //     AppRoutesConst.successRegister,
                          //   );
                          // });

                          // if (_notifier.tabController.index == 0) {
                          //   buildBottomSheet(
                          //       context: context,
                          //       bottomSheet: const BuildOtpCode(
                          //         phoneNumber: '1213123',
                          //       ),
                          //       size: 0.8);
                          // }
                          // _notifier.onNextPage(onStart: () {
                          //   Navigator.pushNamed(
                          //     context,
                          //     AppRoutesConst.successRegister,
                          //   );
                          // });
                        })),
              ]),
        ));
  }
}
