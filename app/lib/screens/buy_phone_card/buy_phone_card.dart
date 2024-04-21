import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/buy_phone_card/modules/buy_card_changenotifier.dart';
import 'package:app/screens/buy_phone_card/pages/mua_the_dt/mua_the_dien_thoai.dart';
import 'package:app/screens/buy_phone_card/pages/phone_recharge/chose_phone_page.dart';
import 'package:app/screens/buy_phone_card/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/globals.dart' as globals;
import 'package:theme_provider/theme_provider.dart';

class BuyPhoneCardScreen extends StatefulWidget {
  const BuyPhoneCardScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => BuyPhoneCardChangenotifier(),
      child: const BuyPhoneCardScreen(),
    );
  }

  @override
  State<BuyPhoneCardScreen> createState() => _BuyPhoneCardScreenState();
}

class _BuyPhoneCardScreenState extends State<BuyPhoneCardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarTopUp(
            title: 'top-up-phone.top-up-phone'.tr(),
            leading: InkWell(
              onTap: () {
                if (globals.navigatorContext != null) {
                  Navigator.of(globals.navigatorContext!)
                      .pushNamedAndRemoveUntil(
                          AppRoutesConst.mainMenu, ((route) => false));
                }
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  isScrollable: false,
                  labelColor: const Color(0xff1658E4),
                  unselectedLabelColor:
                      const Color(0xff030E26).withOpacity(0.4),
                  labelStyle: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1658E4)),
                  unselectedLabelStyle: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff030E26).withOpacity(0.4)),
                  tabs: [
                    Tab(
                      child: Text(
                        'top-up-phone.top-up-phone'.tr(),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'top-up-phone.buy-phone-card'.tr(),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Nội dung của Tab 1
                    ChosePhonePage(),
                    // Nội dung của Tab 2
                    MuaTheDienThoai()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
