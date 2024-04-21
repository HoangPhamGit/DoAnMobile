import 'dart:math';

import 'package:app/screens/home_screen/home_screem_change_notifier.dart';
import 'package:app/screens/home_screen/widget/listview_hoa_don.dart';
import 'package:app/screens/home_screen/widget/notifi_info_hoadon_dichvu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScreenHoaDon extends StatefulWidget {
  const HomeScreenHoaDon({
    super.key,
  });

  @override
  State<HomeScreenHoaDon> createState() => _HomeScreenHoaDonState();
}

class _HomeScreenHoaDonState extends State<HomeScreenHoaDon> {
  bool isCollapsed = false;
  late HomeScreenChangeNotifier _notifier = HomeScreenChangeNotifier();
  @override
  void initState() {
    _notifier = context.read<HomeScreenChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'home-screen.titles.bill'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleMedium!
                      .copyWith(
                          fontWeight: FontWeight.w700, color: Colors.black),
                ),
                const SizedBox(
                  width: 8,
                ),
                buildNotificationInfo(
                    context: context,
                    isMoneyFuc: true,
                    text: '3',
                    width: 20,
                    height: 20,
                    radius: 30),
                const Spacer(),
                Consumer<HomeScreenChangeNotifier>(
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        value.isShowHoaDon();
                      },
                      child: Transform.rotate(
                        angle: value.isShow ? -pi / 2 : pi / 2,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: value.isShow
                              ? const Color.fromRGBO(22, 88, 228, 1)
                              : const Color.fromRGBO(3, 14, 38, 0.4),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<HomeScreenChangeNotifier>(
            builder: (context, value, child) {
              return SizedBox(
                  height: value.isShow ? 220 : 80,
                  child: SingleChildScrollView(
                    scrollDirection:
                        value.isShow ? Axis.vertical : Axis.horizontal,
                    child: value.isShow
                        ? Column(
                            children: [
                              buildListItemHoaDon(
                                context,
                              ),
                              buildListItemHoaDon(
                                context,
                              ),
                              buildListItemHoaDon(
                                context,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              buildListItemHoaDon(
                                context,
                              ),
                              buildListItemHoaDon(
                                context,
                              ),
                              buildListItemHoaDon(
                                context,
                              ),
                            ],
                          ),
                  )
                  // : Column(
                  //     children: [
                  //       SizedBox(
                  //         height: 68,
                  //         child: PageView(
                  //           physics: const AlwaysScrollableScrollPhysics(),
                  //           scrollDirection: Axis.horizontal,
                  //           controller: PageController(),
                  //           onPageChanged: (value) => setState(() {}),
                  //           children: [
                  //             buildListItemHoaDon(
                  //               context,
                  //             ),
                  //             buildListItemHoaDon(
                  //               context,
                  //             ),
                  //             buildListItemHoaDon(
                  //               context,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         height: 7,
                  //       ),
                  //       SmoothPageIndicator(
                  //         controller: PageController(),
                  //         count: 3,
                  //         // onDotClicked: (index) {
                  //         //   dotNavigationIndi;
                  //         // },
                  //         effect: ExpandingDotsEffect(
                  //           radius: 5,
                  //           dotWidth: 5,
                  //           dotHeight: 5,
                  //           activeDotColor:
                  //               const Color.fromARGB(255, 170, 156, 156),
                  //           // expansionFactor: 4,
                  //           dotColor: const Color.fromARGB(255, 189, 169, 169)
                  //               .withOpacity(0.17),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  );
            },
          )
        ],
      ),
    ));
  }
}
