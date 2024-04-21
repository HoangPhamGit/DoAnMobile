import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/modules/register/build_bottom_sheet.dart';
import 'package:app/screens/buy_phone_card/modal_bottom_sheet/chon_nguon_tien.dart';
import 'package:app/screens/buy_phone_card/widgets/build_OTP.dart';
import 'package:app/screens/buy_phone_card/widgets/text_buy_phone.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BuyPhoneCardBottom extends StatefulWidget {
  const BuyPhoneCardBottom({super.key});

  @override
  State<BuyPhoneCardBottom> createState() => _BuyPhoneCardBottomState();
}

class _BuyPhoneCardBottomState extends State<BuyPhoneCardBottom> {
  late LoadingTextButtonController controller = LoadingTextButtonController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 24, right: 24, left: 24, bottom: 31),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'top-up-phone.pay-confirm'.tr(),
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
              height: 32,
            ),
            SizedBox(
              height: 98,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'top-up-phone.fund'.tr(),
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff030E26)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  InkWell(
                    onTap: () {
                      buildBottomSheet(
                          size: 443 / 812,
                          context: context,
                          bottomSheet: const ChonNguonTien());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child:
                                    Image.asset('assets/images/ic_flexpay.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'FlexPay',
                                    style: ThemeProvider.themeOf(context)
                                        .data
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff030E26)),
                                  ),
                                  Text(
                                    'Số dư: 12.394.232đ',
                                    style: ThemeProvider.themeOf(context)
                                        .data
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff030E26)
                                                .withOpacity(0.4)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 24,
                              color: const Color(0xff030E26).withOpacity(0.4),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextBuyPhone(
                titleName: 'top-up-phone.amount-money'.tr(),
                content: '1.000.000đ'.tr()),
            TextBuyPhone(
              titleName: 'top-up-phone.fee'.tr(),
              content: 'Miễn phí',
              colorText: const Color(0xff1658E4),
            ),
            TextBuyPhone(
              titleName: 'top-up-phone.total-amount'.tr(),
              content: '1.000.000đ',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            LoadingTextButton(
                controller: controller,
                onPressed: () {
                  buildBottomSheet(
                      context: context,
                      bottomSheet: const BuildOTP(
                        phoneNumber: '0123456789',
                      ),
                      size: 676 / 812);
                },
                title: 'top-up-phone.recharge'.tr())
          ],
        ),
      ),
    );
  }
}
