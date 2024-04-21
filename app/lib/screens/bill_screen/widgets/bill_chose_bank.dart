import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ChoseBank extends StatefulWidget {
  const ChoseBank({super.key});

  @override
  State<ChoseBank> createState() => _ChoseBankState();
}

class _ChoseBankState extends State<ChoseBank> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 72,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 12, bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE6E6E6), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'bill-management.fund'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff030E26).withOpacity(0.4)),
              ),
              Text(
                'FlexPay',
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff030E26)),
              ),
            ],
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xff1658E4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset('assets/images/vector.png'),
          )
        ],
      ),
    );
  }
}
