import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class GiayToTuyThan extends StatelessWidget {
  const GiayToTuyThan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.outer,
                spreadRadius: 2,
                color: Colors.blue.withOpacity(0.05))
          ],
          border: Border.fromBorderSide(
              BorderSide(width: 1, color: Colors.black.withOpacity(0.05)))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(11),
                    topRight: Radius.circular(11))),
            child: const Text('Giấy tờ tùy thân'),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(11),
                    bottomRight: Radius.circular(11))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/avt_2.png',
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'account-info.row-label.cccd-number'.tr(),
                                    style: ThemeProvider.themeOf(context)
                                        .data
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                3, 14, 38, 0.5)),
                                  ),
                                  Text(
                                    '123412342134',
                                    style: ThemeProvider.themeOf(context)
                                        .data
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: const Color.fromRGBO(
                                                3, 14, 38, 1)),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'account-info.row-label.ngay-cap'.tr(),
                                    style: ThemeProvider.themeOf(context)
                                        .data
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                3, 14, 38, 0.5)),
                                  ),
                                  Text(
                                    '12/09/0222',
                                    style: ThemeProvider.themeOf(context)
                                        .data
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: const Color.fromRGBO(
                                                3, 14, 38, 1)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'account-info.row-label.name'.tr(),
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(3, 14, 38, 0.5)),
                          ),
                          Text(
                            'NGuyen Van a',
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: const Color.fromRGBO(3, 14, 38, 1)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'account-info.row-label.ngay-sinh'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          fontSize: 12,
                          color: const Color.fromRGBO(3, 14, 38, 0.5)),
                ),
                Text(
                  '11/11/1111',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: const Color.fromRGBO(3, 14, 38, 1)),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'account-info.row-label.dc-thuong-chu'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          fontSize: 12,
                          color: const Color.fromRGBO(3, 14, 38, 0.5)),
                ),
                Text(
                  'Thanh xuân, trường chinh, Hà nội, Việt Nam',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: const Color.fromRGBO(3, 14, 38, 1)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
