import 'package:app/components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildPopupDialog({
  required BuildContext context,
  required VoidCallback agreeOnPressed,
  required VoidCallback dismissPressed,
  required String imgPath,
  required String title,
  required String alertContent,
  required String accepText,
  required LoadingTextButtonController btnController,
}) {
  return Center(
    child: Container(
      width: 310,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 262,
            margin:
                const EdgeInsets.only(left: 24, right: 24, bottom: 30, top: 40),
            child: Column(
              children: [
                SizedBox(
                  width: 220,
                  height: 160,
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleMedium!
                      .copyWith(
                          decoration: TextDecoration.none,
                          color: const Color.fromRGBO(3, 14, 38, 1),
                          fontWeight: FontWeight.w700),
                ),
                Text(
                  alertContent,
                  textAlign: TextAlign.center,
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          decoration: TextDecoration.none,
                          color: const Color.fromRGBO(3, 14, 38, 0.7),
                          fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 154.5,
                height: 48,
                child: LoadingTextButton(
                  controller: btnController,
                  onPressed: dismissPressed,
                  title: 'popup.button.later'.tr(),
                  textStyle: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          color: const Color.fromRGBO(3, 14, 38, 0.4),
                          fontWeight: FontWeight.w400),
                  backgroundColor: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(4)),
                  borderColor: const Color.fromRGBO(0, 0, 0, 0.05),
                ),
              ),
              SizedBox(
                width: 154.5,
                height: 48,
                child: LoadingTextButton(
                  controller: btnController,
                  onPressed: agreeOnPressed,
                  title: accepText,
                  textStyle: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          color: const Color.fromRGBO(22, 88, 228, 1),
                          fontWeight: FontWeight.w700),
                  backgroundColor: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(16)),
                  borderColor: const Color.fromRGBO(0, 0, 0, 0.05),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
