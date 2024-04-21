import 'package:app/modules/account_notification/pages/thong_bao_khac_page.dart';
import 'package:app/modules/account_notification/pages/thong_bao_so_du_page.dart';

import 'package:flutter/material.dart';

import 'package:theme_provider/theme_provider.dart';

class AccountNotification extends StatefulWidget {
  const AccountNotification({super.key});
  static Widget create() {
    return const AccountNotification();
  }

  @override
  State<AccountNotification> createState() => _AccountNotificationState();
}

class _AccountNotificationState extends State<AccountNotification> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
              elevation: 1,
              leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  )),
              title: Text(
                "Thông báo",
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleMedium!
                    .copyWith(
                        color: const Color.fromRGBO(3, 14, 38, 1),
                        fontWeight: FontWeight.w700),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: TabBar(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      labelColor: const Color.fromRGBO(22, 88, 228, 1),
                      unselectedLabelColor:
                          const Color.fromRGBO(3, 14, 38, 0.4),
                      labelStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodySmall!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      unselectedLabelStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodySmall!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromRGBO(22, 88, 228, 1)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(2))),
                      tabs: const [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 1, bottom: 1, right: 1),
                          child: Text(
                            "Thông báo số dư",
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 1, bottom: 1, right: 1),
                          child: Text("Thông báo Khác"),
                        )
                      ]),
                ),
                const Expanded(
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ThongBaoSoDuPage(),
                        ThongBaoKhacPage(),
                      ]),
                ),
              ],
            )));
  }
}
