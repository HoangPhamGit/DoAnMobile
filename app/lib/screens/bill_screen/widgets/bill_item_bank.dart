import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillItemBank extends StatefulWidget {
  final String? imagePath;
  final String? nameBank;
  final String? STK;
  final bool? macdinh;
  const BillItemBank(
      {super.key,
      this.imagePath,
      this.nameBank,
      this.STK,
      this.macdinh = false});

  @override
  State<BillItemBank> createState() => _BillItemBankState();
}

class _BillItemBankState extends State<BillItemBank> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.asset(widget.imagePath ?? ''),
              ),
              const SizedBox(
                width: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.nameBank ?? '',
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff030E26)),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          widget.macdinh ?? false
                              ? Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  child: Text(
                                    'bill-management.default'.tr(),
                                    style: ThemeProvider.themeOf(context)
                                        .data
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: const Color(0xff1658E4),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      Text(
                        widget.STK ?? '',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xff030E26).withOpacity(0.4)),
                      )
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
