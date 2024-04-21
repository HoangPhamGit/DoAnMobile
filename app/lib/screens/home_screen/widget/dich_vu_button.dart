import 'package:app/screens/home_screen/widget/notifi_info_hoadon_dichvu.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildDichVuButton(
    {required BuildContext context,
    required imgPath,
    bool? isDiscount,
    String? discount,
    required String text}) {
  return Stack(children: [
    Container(
      width: 69.75,
      height: 98,
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Image.asset(
            imgPath,
            width: 48,
            height: 48,
          ),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.visible,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleSmall!
                  .copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(40, 40, 53, 1)),
            ),
          )
        ],
      ),
    ),
    isDiscount ?? false
        ? Positioned(
            top: 0.5,
            left: 37,
            child: buildNotificationInfo(
                context: context,
                text: discount ?? '',
                width: 29,
                height: 16,
                isMoneyFuc: false))
        : Container()
  ]);
}
