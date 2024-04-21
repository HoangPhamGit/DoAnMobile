import 'package:app/components/components.dart';
import 'package:app/screens/bill_screen/widgets/bill_item.dart';
import 'package:app/screens/bill_screen/widgets/bill_item_bank.dart';
import 'package:app/screens/bill_screen/widgets/item_service_bill.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillListBank extends StatefulWidget {
  const BillListBank({super.key});

  @override
  State<BillListBank> createState() => _BillListBankState();
}

class _BillListBankState extends State<BillListBank> {
  LoadingTextButtonController buttonController = LoadingTextButtonController();
  late bool isSave = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
            padding:
                const EdgeInsets.only(top: 24, right: 24, left: 24, bottom: 28),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'bill-management.chose-fund'.tr(),
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff030E26)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.clear),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      width: 327,
                      height: 48,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: const Color(0xff1658E4),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image.asset('assets/images/vector.png'),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'FlexPay',
                                        style: ThemeProvider.themeOf(context)
                                            .data
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff030E26)),
                                      ),
                                      Text(
                                        'Số dư: 12.394.232đ',
                                        style: ThemeProvider.themeOf(context)
                                            .data
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff030E26)
                                                    .withOpacity(0.4)),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.check,
                            color: Color(0xff1658E4),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 16,
                      thickness: 1,
                      color: const Color(0xff000000).withOpacity(0.05),
                    ),
                    const BillItemBank(
                      imagePath: 'assets/images/ic_teckcombank.png',
                      nameBank: 'Techcombank',
                      STK: '3823 *** *** 3919',
                      macdinh: true,
                    ),
                    Divider(
                      height: 16,
                      thickness: 1,
                      color: const Color(0xff000000).withOpacity(0.05),
                    ),
                    const BillItemBank(
                      imagePath: 'assets/images/ic_viecombank.png',
                      nameBank: 'Vietcombank',
                      STK: '3823 *** *** 3919',
                    ),
                    Divider(
                      height: 16,
                      thickness: 1,
                      color: const Color(0xff000000).withOpacity(0.05),
                    ),
                    const BillItemBank(
                      imagePath: 'assets/images/ic_tppank.png',
                      nameBank: 'TPbank',
                      STK: '3823 *** *** 3919',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    LoadingTextButton(
                      backgroundColor: Color(0xff1658E4).withOpacity(0.15),
                      controller: buttonController,
                      onPressed: () {},
                      title: 'bill-management.add-fund'.tr(),
                      textStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: const Color(0xff1658E4),
                              fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ])));
  }
}
