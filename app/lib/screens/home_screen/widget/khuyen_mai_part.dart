import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScreenKhuyenMai extends StatefulWidget {
  const HomeScreenKhuyenMai({super.key});

  @override
  State<HomeScreenKhuyenMai> createState() => _HomeScreenKhuyenMaiState();
}

class _HomeScreenKhuyenMaiState extends State<HomeScreenKhuyenMai> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 266,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'home-screen.titles.promotion'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleMedium!
                      .copyWith(
                          fontWeight: FontWeight.w700, color: Colors.black),
                ),
                Text('home-screen.titles.all'.tr(),
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(22, 88, 228, 1))),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 219,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                buildKhuyenMaiItem(context),
                buildKhuyenMaiItem(context),
                buildKhuyenMaiItem(context),
                buildKhuyenMaiItem(context),
                buildKhuyenMaiItem(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

buildKhuyenMaiItem(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 274,
          height: 167,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/home_screen_khuyen_mai.png',
                  ),
                  fit: BoxFit.cover)),
        ),
        Text(
          "TH True mart - Vuong thua vu",
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodySmall!
              .copyWith(
                  color: const Color.fromRGBO(22, 88, 228, 1),
                  fontWeight: FontWeight.w400),
        ),
        Text.rich(
          TextSpan(
              text: 'Giảm ',
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleSmall!
                  .copyWith(
                      color: const Color.fromRGBO(3, 14, 38, 1),
                      fontWeight: FontWeight.w400),
              children: <TextSpan>[
                TextSpan(
                  text: ' 8.283',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          color: const Color.fromRGBO(3, 14, 38, 1),
                          fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: 'đ',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          decoration: TextDecoration.underline,
                          color: const Color.fromRGBO(3, 14, 38, 1),
                          fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: ' cho vai mặt hàng',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          color: const Color.fromRGBO(3, 14, 38, 1),
                          fontWeight: FontWeight.w400),
                )
              ]),
        ),
      ],
    ),
  );
}
