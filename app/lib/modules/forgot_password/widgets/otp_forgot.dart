import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:theme_provider/theme_provider.dart';

class OTPForgotPassword extends StatefulWidget {
  final String? phoneNumber;
  final ValueChanged<String>? oncompleted;
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  final bool? check;

  const OTPForgotPassword(
      {super.key,
      this.phoneNumber,
      this.oncompleted,
      this.controller,
      this.check,
      this.onChange});
  @override
  State<OTPForgotPassword> createState() => _OTPForgotPassword();
}

class _OTPForgotPassword extends State<OTPForgotPassword> {
  late final TextEditingController textController;
  late StreamController<ErrorAnimationType>? errorController;
  final formKey = GlobalKey<FormState>();
  int time = 20;
  late Timer countdownTimer;
  @override
  void initState() {
    super.initState();
    _startTime();
    textController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    textController.dispose();
    errorController!.close();

    super.dispose();
  }

  void verifyOtpCode(String text) {
    if (text == '123456') {}
  }

  _startTime() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = time - 1;
      });
      if (time < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTime() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
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
            'forgot-password.otp'.tr(),
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
            'forgot-password.enter-otp-validation'.tr(),
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
            key: formKey,
            child: PinCodeTextField(
              controller: widget.controller,
              appContext: context,
              length: 6,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              onChanged: widget.onChange,
              onCompleted: widget.oncompleted,
              textStyle: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleLarge!
                  .copyWith(
                      fontWeight: FontWeight.w700,
                      color: widget.check ?? false
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
              'forgot-password.resend-otp'.tr(),
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
