import 'package:app/screens/home/widgets/header/top_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;

import '../../../../configs/routes/app_routes_const.dart';

class ExpandedHeader extends StatelessWidget {
  const ExpandedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ThemeProvider.themeOf(context)
                    .data
                    .primaryColor
                    .withOpacity(0.7),
                ThemeProvider.themeOf(context)
                    .data
                    .primaryColor
                    .withOpacity(0.5),
                ThemeProvider.themeOf(context)
                    .data
                    .primaryColor
                    .withOpacity(0.1),
                Colors.transparent,
              ],
            ),
          ),
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildButton(context,
                      title: 'home-screen.money-services.nap-tien'.tr(),
                      svgPath: 'assets/images/svg/home_screen_nap_tien.svg',
                      onPressed: () {
                    if (globals.navigatorContext != null) {
                      Navigator.of(globals.navigatorContext!)
                          .pushNamed(AppRoutesConst.cashIn);
                    }
                  }),
                  buildButton(context,
                      title: 'home-screen.money-services.rut-tien'.tr(),
                      svgPath: 'assets/images/svg/home_screen_rut_tien.svg',
                      onPressed: () {
                    if (globals.navigatorContext != null) {
                      Navigator.of(globals.navigatorContext!)
                          .pushNamed(AppRoutesConst.buyPhoneCard);
                    }
                  }),
                  buildButton(
                    context,
                    title: 'home-screen.money-services.chuyen-tien'.tr(),
                    svgPath: 'assets/images/svg/home_screen_chuyen_tien.svg',
                  ),
                  buildButton(
                    context,
                    title: 'home-screen.money-services.lien-ket'.tr(),
                    svgPath: 'assets/images/svg/home_screen_lien_ket.svg',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "Số dư: ",
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white.withOpacity(0.4)),
                      ),
                      Text(
                        "12.938.223 ₫",
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.visibility_off_outlined,
                        color: Color(0xff4AF1E7),
                        size: 22,
                      ),
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
        const Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: TopHeader(),
        ),
      ],
    );
  }

  Widget buildButton(
    BuildContext context, {
    required String svgPath,
    required String title,
    Function? onPressed,
  }) {
    return InkWell(
      onTap: () {
        if (onPressed != null) onPressed();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              border: Border.all(color: Colors.white.withOpacity(0.15)),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall
                ?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
          )
        ],
      ),
    );
  }
}
