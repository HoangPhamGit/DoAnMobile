import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScreenUuDaiKhac extends StatefulWidget {
  const HomeScreenUuDaiKhac({super.key});

  @override
  State<HomeScreenUuDaiKhac> createState() =>
      __HomeScreenUuDaiKhacUuDaiKhacState();
}

class __HomeScreenUuDaiKhacUuDaiKhacState extends State<HomeScreenUuDaiKhac> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'home-screen.titles.preferential'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
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
          const SizedBox(
            height: 24,
          ),
          Flexible(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  padding: const EdgeInsets.only(top: 2),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 250,
                  ),
                  itemBuilder: (_, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 159.5,
                          height: 158,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/home_screen_uu_dai.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Mua Hang qua FlexPay Khi Mua hang giam 5%",
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: const Color.fromRGBO(3, 14, 38, 1),
                                  fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "16 tháng 2, 2022",
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 12,
                                  color: const Color.fromRGBO(3, 14, 38, 0.4),
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
