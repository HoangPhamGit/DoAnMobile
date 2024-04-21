import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/buy_phone_card/modules/buy_card_changenotifier.dart';
import 'package:app/screens/buy_phone_card/widgets/app_bar.dart';
import 'package:app/screens/buy_phone_card/widgets/user_danh_ba.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;

class DanhBaScreen extends StatefulWidget {
  const DanhBaScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => BuyPhoneCardChangenotifier(),
      child: const DanhBaScreen(),
    );
  }

  @override
  State<DanhBaScreen> createState() => _DanhBaScreenState();
}

class _DanhBaScreenState extends State<DanhBaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1658E4),
      appBar: AppBarTopUp(
        title: 'top-up-phone.phonebook'.tr(),
        backgroundColor: const Color(0xff1658E4),
        textStyle: ThemeProvider.themeOf(context)
            .data
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            FssTextField(
              hintText: 'top-up-phone.enter-search'.tr(),
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
                color: Color(0xff030E26),
              ),
              padding: const EdgeInsets.all(8),
            ),
            const SizedBox(
              height: 16,
            ),
            Selector<BuyPhoneCardChangenotifier, List<Map<String, dynamic>>>(
              selector: (p0, p1) => p1.danhBa,
              shouldRebuild: (previous, next) => true,
              builder: (context, danhBa, child) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: danhBa.length,
                      itemBuilder: (context, index) {
                        final item = danhBa[index];
                        return InkWell(
                          onTap: () {
                            Provider.of<BuyPhoneCardChangenotifier>(context,
                                    listen: false)
                                .choseUser(item);
                            if (globals.navigatorContext != null) {
                              Navigator.of(globals.navigatorContext!)
                                  .pop(AppRoutesConst.buyPhoneCard);
                            }
                          },
                          child: UserDanhBa(
                            avatar: item['avatar'],
                            userName: item['nameUser'],
                            phoneNumber: item['phoneNumber'],
                          ),
                        );
                      }),
                );
              },
            ),
            Selector<BuyPhoneCardChangenotifier, Map<String, dynamic>>(
              selector: (p0, p1) => p1.object,
              shouldRebuild: (previous, next) => true,
              builder: (context, user, child) {
                if (user == null || user.isEmpty) {
                  user['nameUser'] = 'Số của tôi';
                }
                return Text(
                  user['nameUser'],
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          color: const Color(0xff030E26).withOpacity(0.4),
                          fontWeight: FontWeight.w400),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
