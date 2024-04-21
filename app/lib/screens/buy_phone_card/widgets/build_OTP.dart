import 'dart:async';

import 'package:app/configs/routes/app_routes_const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;

class BuildOTP extends StatefulWidget {
  final String? phoneNumber;
  const BuildOTP({super.key, this.phoneNumber});

  @override
  State<BuildOTP> createState() => _BuildOTPState();
}

class _BuildOTPState extends State<BuildOTP> {
  TextEditingController controller = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  int time = 20;
  late Timer coutdouwnTimer;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _startTime();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  _startTime() {
    coutdouwnTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = time - 1;
      });
      if (time < 1) {
        coutdouwnTimer.cancel();
      }
    });
  }

  stopTime() {
    if (coutdouwnTimer.isActive) {
      coutdouwnTimer.cancel();
    }
  }

  // snackBar(String? message) {
  //   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(message!),
  //     duration: const Duration(seconds: 1),
  //   ));
  // }

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
            'top-up-phone.otp'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'top-up-phone.enter-otp-validation'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(3, 14, 38, 0.7)),
          ),
          Text(
            widget.phoneNumber ?? '123456',
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
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
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
                    Navigator.of(globals.navigatorContext!)
                        .pushNamed(AppRoutesConst.chiTietGD);
                  }
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
            height: 24,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'top-up-phone.resend-otp'.tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                      fontWeight: FontWeight.w600,
                      color: time > 0
                          ? const Color.fromRGBO(3, 14, 38, 0.4)
                          : const Color.fromRGBO(22, 88, 228, 1)),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '(${time}s)',
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                    fontWeight: FontWeight.w400,
                    color: time == 0
                        ? const Color.fromRGBO(3, 14, 38, 0.4)
                        : const Color.fromRGBO(22, 88, 228, 1)),
          )
        ],
      ),
    );
  }
}
