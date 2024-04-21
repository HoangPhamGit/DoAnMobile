import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/buy_phone_card/modal_bottom_sheet/confirm_bottom_sheet.dart';
import 'package:app/screens/buy_phone_card/modules/buy_card_changenotifier.dart';
import 'package:app/screens/buy_phone_card/widgets/build_bottomsheet.dart';
import 'package:app/screens/buy_phone_card/widgets/item_nha_mang.dart';
import 'package:app/screens/buy_phone_card/widgets/list_gia_nap.dart';
import 'package:app/screens/buy_phone_card/widgets/so_luong_the.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
// import 'package:app/globals.dart' as globals;

class MuaTheDienThoai extends StatefulWidget {
  const MuaTheDienThoai({super.key});

  @override
  State<MuaTheDienThoai> createState() => _MuaTheDienThoaiState();
}

class _MuaTheDienThoaiState extends State<MuaTheDienThoai> {
  LoadingTextButtonController buttonController = LoadingTextButtonController();
  @override
  void initState() {
    buttonController = LoadingTextButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 24, bottom: 30, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'top-up-phone.choose-carrier'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff030E26)),
              ),
              const SizedBox(
                height: 8,
              ),
              const ListNhaMang(),
              Divider(
                thickness: 1,
                height: 32,
                color: const Color(0xff000000).withOpacity(0.05),
              ),
              ListGiaNap(
                title: 'top-up-phone.card-value'.tr(),
              ),
              Divider(
                thickness: 1,
                height: 32,
                color: const Color(0xff000000).withOpacity(0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'top-up-phone.number-of-card'.tr(),
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff030E26)),
                  ),
                  const SoLuongThe(),
                ],
              ),
              Divider(
                thickness: 1,
                height: 32,
                color: const Color(0xff000000).withOpacity(0.05),
              ),
              Text(
                'top-up-phone.promotional-code'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff030E26)),
              ),
              const SizedBox(
                height: 8,
              ),
              // InkWell(
              //   onTap: () {
              // if (globals.navigatorContext != null) {
              //   Navigator.of(globals.navigatorContext!)
              //       .pushNamed(AppRoutesConst.khuyenMai);
              // }
              //   },
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
              //     height: 50,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: const Color(0xffFFF8E6),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Row(
              //           children: [
              //             SizedBox(
              //               width: 24,
              //               height: 24,
              //               child: Image.asset(
              //                 'assets/images/ic_khuyen_mai.png',
              //                 width: 24,
              //                 height: 24,
              //               ),
              //             ),
              //             const SizedBox(
              //               width: 14,
              //             ),
              //             Text(
              //               '3 Mã khả dụng',
              //               style: ThemeProvider.themeOf(context)
              //                   .data
              //                   .textTheme
              //                   .titleSmall!
              //                   .copyWith(
              //                       fontWeight: FontWeight.w400,
              //                       color: const Color(0xff030E26)),
              //             )
              //           ],
              //         ),
              //         const Icon(
              //           Icons.arrow_forward_ios,
              //           color: Color(0xff030E26),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 8,
              ),
              Selector<BuyPhoneCardChangenotifier, double>(
                selector: (p0, p1) => p1.selectedIndex,
                shouldRebuild: (previous, next) => true,
                builder: (context, value, child) {
                  if (value != -1) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'top-up-phone.provisional'.tr(),
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff030E26).withOpacity(0.7),
                              ),
                        ),
                        Selector<BuyPhoneCardChangenotifier, double>(
                          selector: (p0, p1) => p1.tamTinh(),
                          shouldRebuild: (previous, next) => true,
                          builder: (context, tamTinh, child) {
                            return Text(
                              '${NumberFormat("#,##0.###").format(tamTinh)}đ',
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff030E26),
                                  ),
                            );
                          },
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
          LoadingTextButton(
            controller: buttonController,
            onPressed: () {
              buildBottomSheet(
                  context: context,
                  bottomSheet: const BuyPhoneCardBottom(),
                  size: 443 / 812);
            },
            title: 'top-up-phone.continue'.tr(),
            height: 48,
          )
        ],
      ),
    );
  }
}
