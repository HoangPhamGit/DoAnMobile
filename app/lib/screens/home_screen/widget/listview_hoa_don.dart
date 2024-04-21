import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildListItemHoaDon(
  BuildContext context,
// String imgPath,
//     String nameCompany, String idHoaDon, String totalMoney
) {
  return Container(
    height: 68,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    padding: const EdgeInsets.all(12),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(39, 100, 230, 0.05),
        borderRadius: BorderRadius.circular(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/images/account_image.png',
            ),
          )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dien luc EVN",
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: '${'home-screen.bill.code'.tr()}: ',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(3, 14, 38, 0.4)),
                          children: [
                        TextSpan(
                          text: '1234567',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        )
                      ])),
                  const VerticalDivider(
                    indent: 3,
                    endIndent: 3,
                    width: 12,
                    thickness: 1,
                    color: Color.fromRGBO(230, 230, 230, 1),
                  ),
                  RichText(
                      text: TextSpan(
                          text: '${'home-screen.bill.bill-balance'.tr()}: ',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(3, 14, 38, 0.4)),
                          children: [
                        TextSpan(
                          text: '1234567đ',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        )
                      ])),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
