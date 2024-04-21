import 'package:app/modules/forgot_password/notifier/enter_phone_number_notifier.dart';
import 'package:app/modules/forgot_password/widgets/forgot_password_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.black,
          ),
        ),
        title: Text(
          "forgot-password.title-forgot-password".tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(3, 14, 38, 1)),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "forgot-password.content".tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(3, 14, 38, 0.7)),
            ),
            const SizedBox(
              height: 16,
            ),
            ForgotPasswordTextField(
                fomrkey: Provider.of<EnterPhoneNumberChangNotifier>(context,
                        listen: false)
                    .formKey,
                hinText: 'forgot-password.phone-number'.tr(),
                controller: Provider.of<EnterPhoneNumberChangNotifier>(context,
                        listen: false)
                    .phoneNumberController,
                password: false,
                validator: (value) {
                  return Provider.of<EnterPhoneNumberChangNotifier>(context,
                          listen: false)
                      .checkPhoneNumber();
                }),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return ForgotPasswordPage(
  //     title: "forgot-password.title-forgot-password".tr(),
  //     textBottomTitle: "forgot-password.content".tr(),
  // textField: ForgotPasswordTextField(
  //     key:
  //         Provider.of<EnterPhoneNumberChangNotifier>(context, listen: false)
  //             .formKey,
  //     hinText: 'forgot-password.phone-number'.tr(),
  //     controller:
  //         Provider.of<EnterPhoneNumberChangNotifier>(context, listen: false)
  //             .phoneNumberController,
  //     password: false,
  //     validator: (value) {
  //       return Provider.of<EnterPhoneNumberChangNotifier>(context,
  //               listen: false)
  //           .checkPhoneNumber();
  //     }),
  //   );
  // }
}
