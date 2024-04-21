import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/home_screen/widget/home_screen_expanded_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app/globals.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliver_snap/sliver_snap.dart';
import 'package:theme_provider/theme_provider.dart';

class HomePageExpandedContent extends StatelessWidget {
  const HomePageExpandedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandedContent(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/home_page_background.png',
            colorBlendMode: BlendMode.overlay,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // CircleAvatar(
                    //   radius: 30,
                    //   child: Image.asset(
                    //     'assets/images/account_image.png',
                    //   ),
                    // ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          'assets/images/account_image.png',
                        ),
                      )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${'home-screen.account.hello'.tr()}, ${'home-screen.account.user-name'.tr()}!',
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (globals.navigatorContext != null) {
                          Navigator.of(globals.navigatorContext!)
                              .pushNamed(AppRoutesConst.accountNotification);
                        }
                      },
                      child: _buildNotification(context, true),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutesConst.accountNotification);
                      },
                      child: SvgPicture.asset(
                          'assets/images/svg/homw_screen_search.svg'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 77,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildButtonFunction(
                      context: context,
                      onPressed: () {
                        if (globals.navigatorContext != null) {
                          Navigator.of(globals.navigatorContext!)
                              .pushNamed(AppRoutesConst.buyPhoneCard);
                        }
                      },
                      text: 'home-screen.money-services.nap-tien'.tr(),
                      svgPath: 'assets/images/svg/home_screen_nap_tien.svg',
                      textColor: const Color.fromRGBO(255, 255, 255, 0.7),
                      width: 81.75,
                      height: 82,
                    ),
                    buildButtonFunction(
                      context: context,
                      onPressed: () {
                        if (globals.navigatorContext != null) {
                          Navigator.of(globals.navigatorContext!)
                              .pushNamed(AppRoutesConst.taiKhoanVi);
                        }
                      },
                      text: 'home-screen.money-services.rut-tien'.tr(),
                      svgPath: 'assets/images/svg/home_screen_rut_tien.svg',
                      textColor: const Color.fromRGBO(255, 255, 255, 0.7),
                      width: 81.75,
                      height: 82,
                    ),
                    buildButtonFunction(
                      context: context,
                      onPressed: () {},
                      text: 'home-screen.money-services.chuyen-tien'.tr(),
                      svgPath: 'assets/images/svg/home_screen_chuyen_tien.svg',
                      textColor: const Color.fromRGBO(255, 255, 255, 0.7),
                      width: 81.75,
                      height: 82,
                    ),
                    buildButtonFunction(
                      context: context,
                      onPressed: () {
                        if (globals.navigatorContext != null) {
                          Navigator.of(globals.navigatorContext!)
                              .pushNamed(AppRoutesConst.quanLyLienKet);
                        }
                      },
                      text: 'home-screen.money-services.lien-ket'.tr(),
                      svgPath: 'assets/images/svg/home_screen_lien_ket.svg',
                      textColor: const Color.fromRGBO(255, 255, 255, 0.7),
                      width: 81.75,
                      height: 82,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: Container(
                    width: 327,
                    padding: const EdgeInsets.only(
                        top: 24, right: 24, left: 24, bottom: 24),
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11.28),
                            topRight: Radius.circular(11.28)),
                        color: Color.fromRGBO(22, 88, 228, 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'home-screen.account.balance'.tr(),
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.4)),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(0, -2, 0),
                          child: const Text(
                            "...",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 24,
                              color: Color.fromRGBO(74, 241, 231, 1),
                            )),
                        const Spacer(),
                        Transform(
                          transform: Matrix4.translationValues(0, -4, 0),
                          child: SvgPicture.asset(
                            'assets/images/svg/logo.svg',
                            width: 17,
                            height: 28.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_buildNotification(BuildContext context, bool haveNoti) {
  return Stack(
    children: [
      SvgPicture.asset('assets/images/svg/home_screen_notification.svg'),
      Positioned(
          top: 2,
          left: 10,
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(249, 62, 62, 1), shape: BoxShape.circle),
          ))
    ],
  );
}
