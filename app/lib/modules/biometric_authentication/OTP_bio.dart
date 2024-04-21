import 'dart:async';

import 'package:app/configs/routes/app_routes_const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;

class OTPBio extends StatefulWidget {
  final String? phoneNumber;
  const OTPBio({super.key, this.phoneNumber});

  @override
  State<OTPBio> createState() => _OTPBioState();
}

class _OTPBioState extends State<OTPBio> {
  TextEditingController controller = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff000000).withOpacity(0.3)),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                message!,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xff0ABD59),
      duration: const Duration(seconds: 10),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            color: const Color.fromRGBO(216, 218, 229, 1),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'biometric_authentication.enter-pin-code'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .headlineLarge!
                .copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff030E26)),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'biometric_authentication.enter-pin-activate'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(3, 14, 38, 0.7)),
          ),
          const SizedBox(
            height: 32,
          ),
          Form(
            key: formKey,
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              obscureText: true,
              obscuringCharacter: hasError ? '-' : '\u25CF',
              textStyle: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleLarge!
                  .copyWith(
                      fontWeight: FontWeight.w700,
                      color: hasError
                          ? Colors.red
                          : const Color.fromRGBO(3, 14, 38, 1)),
              pastedTextStyle: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleLarge!
                  .copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(3, 14, 38, 1)),
              autoFocus: true,
              onCompleted: (value) {
                if (value == '123456') {
                  if (globals.navigatorContext != null) {
                    Navigator.of(globals.navigatorContext!).pop(context);
                  }
                  snackBar('biometric_authentication.success-active'.tr());
                  setState(() {
                    hasError = false;
                  });
                } else {
                  setState(() {
                    hasError = true;
                  });
                }
              },
              onChanged: (value) {
                setState(() {
                  currentText = value;
                  hasError = false;
                });
              },
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 56,
                  fieldWidth: 50.5,
                  activeFillColor: const Color.fromRGBO(246, 246, 247, 1),
                  selectedColor: const Color.fromRGBO(246, 246, 247, 1),
                  activeColor: const Color.fromRGBO(246, 246, 247, 1),
                  inactiveColor: const Color.fromRGBO(246, 246, 247, 1)),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'biometric_authentication.forgot-pin-code'.tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff1658E4)),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
