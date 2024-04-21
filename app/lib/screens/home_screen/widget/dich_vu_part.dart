import 'package:app/configs/routes/app_routes_const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;

import 'dich_vu_button.dart';

final imgPathPng = [
  {
    'imgPath': 'assets/images/dich_vu/dich_vu_nap_tien.png',
    'title': 'home-screen.services.nap-tien'.tr(),
    'isPromo': false,
    'promotion': -5
  },
  {
    'imgPath': 'assets/images/dich_vu/dich_vu_chuyen_tien.png',
    'title': 'home-screen.services.chuyen-tien'.tr(),
    'isPromo': false,
    'promotion': -5
  },
  {
    'imgPath': 'assets/images/dich_vu/dich_vu_khuyen_mai_cua_ban.png',
    'title': 'home-screen.services.khuyen-mai'.tr(),
    'isPromo': false,
    'promotion': -5
  },
  {
    'imgPath': 'assets/images/dich_vu/dich_vu_mua_the_dien_thoai.png',
    'title': 'home-screen.services.mua-the'.tr(),
    'isPromo': true,
    'promotion': -5
  },
  {
    'imgPath': 'assets/images/dich_vu/dich_vu_quan_li_the_nh.png',
    'title': 'home-screen.services.ql-the'.tr(),
    'isPromo': false,
    'promotion': -5
  },
  {
    'imgPath': 'assets/images/dich_vu/dich_vu_quan_li_hoa_don.png',
    'title': 'home-screen.services.ql-hoa-don'.tr(),
    'isPromo': false,
    'promotion': -5
  },
  {
    'imgPath': 'assets/images/dich_vu/dich_vu_hoa_don_dien.png',
    'title': 'home-screen.services.hd-dien'.tr(),
    'isPromo': false,
    'promotion': -5
  },
  {
    'imgPath': 'assets/images/dich_vu/dich_vu_hoa_don_nuoc.png',
    'title': 'home-screen.services.hd-nuoc'.tr(),
    'isPromo': true,
    'promotion': -5
  },
];

class HomeScreenDichVu extends StatefulWidget {
  const HomeScreenDichVu({
    super.key,
  });

  @override
  State<HomeScreenDichVu> createState() => _HomeScreenDichVuState();
}

class _HomeScreenDichVuState extends State<HomeScreenDichVu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'home-screen.titles.services'.tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
            ),
            InkWell(
              onTap: () {
                if (globals.navigatorContext != null) {
                  Navigator.of(globals.navigatorContext!)
                      .pushNamed(AppRoutesConst.dichVu);
                }
              },
              child: Text('home-screen.titles.all'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(22, 88, 228, 1))),
            ),
          ],
        ),
        Flexible(
            child: GridView.builder(
                padding: const EdgeInsets.only(top: 24),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: imgPathPng.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 88),
                itemBuilder: (_, index) {
                  final data = imgPathPng[index];
                  return buildDichVuButton(
                      context: context,
                      imgPath: data['imgPath'].toString(),
                      text: data['title'].toString(),
                      isDiscount: data['isPromo'] as bool,
                      discount: data['promotion'].toString());
                }))
      ]),
    );
  }
}
