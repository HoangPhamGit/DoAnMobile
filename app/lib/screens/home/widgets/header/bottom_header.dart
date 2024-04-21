import 'package:app/screens/home/notifiers/home_change_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class BottomHeader extends StatelessWidget {
  const BottomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeChangeNotifier, bool>(
      selector: (p0, p1) => p1.isCollapsed,
      builder: (context, isCollapsed, child) {
        if (!isCollapsed) return const SizedBox.shrink();
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  buildButton(
                    context,
                    title: 'home-screen.money-services.nap-tien'.tr(),
                    svgPath: 'assets/images/svg/home_screen_nap_tien.svg',
                  ),
                  const SizedBox(width: 8),
                  buildButton(
                    context,
                    title: 'home-screen.money-services.rut-tien'.tr(),
                    svgPath: 'assets/images/svg/home_screen_rut_tien.svg',
                  ),
                  const SizedBox(width: 8),
                  buildButton(
                    context,
                    title: 'home-screen.money-services.chuyen-tien'.tr(),
                    svgPath: 'assets/images/svg/home_screen_chuyen_tien.svg',
                  ),
                  const SizedBox(width: 8),
                  buildButton(
                    context,
                    title: 'home-screen.money-services.lien-ket'.tr(),
                    svgPath: 'assets/images/svg/home_screen_lien_ket.svg',
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildButton(
    BuildContext context, {
    required String title,
    required String svgPath,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
        ),
        color: Colors.white.withOpacity(0.05),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        children: [
          SvgPicture.asset(
            svgPath,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}
