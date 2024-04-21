import 'package:app/components/components.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/buy_phone_card/modules/buy_card_changenotifier.dart';
import 'package:app/screens/buy_phone_card/widgets/app_bar.dart';
import 'package:app/screens/buy_phone_card/widgets/button_buy_phone_card.dart';
import 'package:app/screens/buy_phone_card/widgets/text_chi_tiet_gd.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/globals.dart' as globals;

class ChiTietGiaoDich extends StatefulWidget {
  const ChiTietGiaoDich({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => BuyPhoneCardChangenotifier(),
      child: const ChiTietGiaoDich(),
    );
  }

  @override
  State<ChiTietGiaoDich> createState() => _ChiTietGiaoDichState();
}

class _ChiTietGiaoDichState extends State<ChiTietGiaoDich> {
  LoadingTextButtonController buttonController = LoadingTextButtonController();

  @override
  void initState() {
    buttonController = LoadingTextButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarTopUp(
        title: 'top-up-phone.transaction-details'.tr(),
        leading: InkWell(
          onTap: () {
            if (globals.navigatorContext != null) {
              Navigator.of(globals.navigatorContext!).pop();
            }
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 24, bottom: 30, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Image.asset('assets/images/ic_mua_the.png'),
                ),
                TextChiTietGD(
                  title: 'top-up-phone.transaction-type'.tr(),
                  content: 'top-up-phone.top-up-phone'.tr(),
                ),
                TextChiTietGD(
                  title: 'top-up-phone.status'.tr(),
                  content: 'top-up-phone.success'.tr(),
                  colorText: const Color(0xff1AB60B),
                  colorImage: const Color(0xff1AB60B),
                  imagePath: 'assets/images/svg/ic_success.svg',
                  showIcon: true,
                ),
                TextChiTietGD(
                  title: 'top-up-phone.trading-code'.tr(),
                  content: '19281928282912',
                  showIcon: true,
                  imagePath: 'assets/images/svg/ic_copy.svg',
                  colorImage: const Color(0xff1658E4),
                ),
                TextChiTietGD(
                  title: 'top-up-phone.time'.tr(),
                  content: '16/03/2024 - 16:33',
                ),
                TextChiTietGD(
                  title: 'top-up-phone.account'.tr(),
                  content: '*** 3919',
                  colorText: const Color(0xff1B8248),
                  showIconNganHang: true,
                  imagePathNganHang: 'assets/images/ic_viecombank.png',
                ),
                TextChiTietGD(
                  title: 'top-up-phone.fee'.tr(),
                  content: 'Miễn phí',
                  colorText: const Color(0xff1658E4),
                ),
                TextChiTietGD(
                  title: 'top-up-phone.amount-money'.tr(),
                  content: '1.000.000đ',
                ),
              ],
            ),
            Column(
              children: [
                const ButtonBuyPhoneCard(
                  isShowIcon: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                LoadingTextButton(
                    height: 48,
                    controller: buttonController,
                    onPressed: () {
                      if (globals.navigatorContext != null) {
                        Navigator.of(globals.navigatorContext!)
                            .pushNamed(AppRoutesConst.buyPhoneCard);
                      }
                    },
                    title: 'top-up-phone.trade-again'.tr())
              ],
            )
          ],
        ),
      ),
    );
  }
}
