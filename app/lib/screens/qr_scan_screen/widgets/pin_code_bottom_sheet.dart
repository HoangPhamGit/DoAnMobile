import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:theme_provider/theme_provider.dart';

class BuildPinCode extends StatefulWidget {
  const BuildPinCode({
    super.key,
  });
  @override
  State<BuildPinCode> createState() => _BuildPinCodeState();
}

class _BuildPinCodeState extends State<BuildPinCode> {
  late final TextEditingController textController;
  late StreamController<ErrorAnimationType>? errorController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    textController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    textController.dispose();
    errorController!.close();
    super.dispose();
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
              'QR.title.enter-pin'.tr(),
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
              'QR.content.nhap-ma'.tr(),
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
                textStyle: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleLarge!
                    .copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(3, 14, 38, 1)),
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
                'QR.title.forgot-pin'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(22, 88, 228, 1)),
              ),
            ),
          ],
        ));
  }
}
