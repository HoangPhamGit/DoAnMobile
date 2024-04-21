import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliver_snap/sliver_snap.dart';
import 'package:theme_provider/theme_provider.dart';

class HomePageCollapsed extends StatelessWidget {
  const HomePageCollapsed({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsedAppBarContent(
      leading: CircleAvatar(
        backgroundColor: const Color.fromRGBO(6, 68, 200, 1),
        radius: 30,
        child: Image.asset(
          'assets/images/account_image.png',
        ),
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(
          'home-screen.account.balance'.tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodyMedium!
              .copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(255, 255, 255, 0.4)),
        ),
        Transform(
          transform: Matrix4.translationValues(0, -2, 0),
          child: const Text(
            "...",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove_red_eye_outlined,
              size: 24,
              color: Color.fromRGBO(74, 241, 231, 1),
            )),
      ]),
      trailing: Row(
        children: [
          _buildNotification(context, true),
          const SizedBox(
            width: 16,
          ),
          SvgPicture.asset('assets/images/svg/homw_screen_search.svg'),
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
