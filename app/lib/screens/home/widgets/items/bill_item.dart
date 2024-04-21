import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillItem extends StatelessWidget {
  const BillItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(39, 100, 230, 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ThemeProvider.themeOf(context).data.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/bill_icon.png',
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Điện lực EVN Hà Nội",
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Row(
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
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
