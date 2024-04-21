import 'package:app/screens/bill_screen/modules/notifier/bill_notifier/bill_changnotifier.dart';
import 'package:app/screens/bill_screen/widgets/bill_show_option.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class BillItem extends StatefulWidget {
  final bool? isPayAuto;
  const BillItem({super.key, this.isPayAuto});

  @override
  State<BillItem> createState() => _BillItemState();
}

class _BillItemState extends State<BillItem> {
  @override
  Widget build(BuildContext context) {
    return Selector<BillChangNotifier, List<Map<String, dynamic>>>(
      selector: (p0, p1) => p1.bill,
      shouldRebuild: (n, p) => true,
      builder: (context, bill, child) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: bill.length,
            itemBuilder: (context, index) {
              final item = bill[index];
              return Container(
                width: 343,
                height: 226,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        width: 1,
                        color: const Color(0xff000000).withOpacity(0.05))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset(
                                item['imagePath'],
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              height: 46,
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: ThemeProvider.themeOf(context)
                                          .data
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff030E26)),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: item['status'] ==
                                                  'Chờ thanh toán'
                                              ? BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: const Color(
                                                      0xff1658E4),
                                                  boxShadow: [
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xff1658E4)
                                                              .withOpacity(
                                                                  0.15),
                                                          spreadRadius: 4)
                                                    ])
                                              : item['status'] == 'Chưa đến hạn'
                                                  ? BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: const Color(
                                                              0xff030E26)
                                                          .withOpacity(0.25),
                                                      boxShadow: [
                                                          BoxShadow(
                                                              color: const Color(
                                                                      0xff030E26)
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 4)
                                                        ])
                                                  : BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: const Color(
                                                          0xffEC1D25),
                                                      boxShadow: [
                                                          BoxShadow(
                                                              color: const Color(
                                                                      0xffEC1D25)
                                                                  .withOpacity(
                                                                      0.15),
                                                              spreadRadius: 4)
                                                        ]),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          item['status'],
                                          style: item['status'] ==
                                                  'Chờ thanh toán'
                                              ? ThemeProvider.themeOf(context)
                                                  .data
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xff1658E4))
                                              : item['status'] == 'Chưa đến hạn'
                                                  ? ThemeProvider.themeOf(context)
                                                      .data
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                                  0xff030E26)
                                                              .withOpacity(0.4))
                                                  : ThemeProvider.themeOf(context)
                                                      .data
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0xffEC1D25)),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showMoreOption(
                                context: context,
                                isPayAuto: widget.isPayAuto ?? false);
                          },
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                                'assets/images/svg/ic_menu.svg'),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mã hợp đồng',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff030E26).withOpacity(0.4)),
                        ),
                        Text(
                          item['IDcontract'],
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff030E26)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'bill-management.customer-name'.tr(),
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff030E26).withOpacity(0.4)),
                        ),
                        Text(
                          item['userName'],
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff030E26)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'bill-management.money'.tr(),
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff030E26).withOpacity(0.4)),
                        ),
                        Text(
                          '${(item['money'] / 1000).toStringAsFixed(3)}đ',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff030E26)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color(0xff1658E4).withOpacity(0.25)),
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff1658E4).withOpacity(0.05)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/images/svg/ic_thanh_toan.svg'),
                          Text(
                            'bill-management.pay-immediately'.tr(),
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff1658E4)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
