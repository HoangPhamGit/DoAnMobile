import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QuanLyDichVuChangeNotifier extends ChangeNotifier {
  final dichVu = [
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_nap_tien.png',
      'title': 'home-screen.services.nap-tien'.tr(),
      'isAdd': false,
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_chuyen_tien.png',
      'title': 'home-screen.services.chuyen-tien'.tr(),
      'isAdd': false,
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_khuyen_mai_cua_ban.png',
      'title': 'home-screen.services.khuyen-mai'.tr(),
      'isAdd': true,
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_mua_the_dien_thoai.png',
      'title': 'home-screen.services.mua-the'.tr(),
      'isAdd': true,
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_quan_li_the_nh.png',
      'title': 'home-screen.services.ql-the'.tr(),
      'isAdd': true,
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_quan_li_hoa_don.png',
      'title': 'home-screen.services.ql-hoa-don'.tr(),
      'isAdd': false,
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_hoa_don_dien.png',
      'title': 'home-screen.services.hd-dien'.tr(),
      'isAdd': true,
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_hoa_don_nuoc.png',
      'title': 'home-screen.services.hd-nuoc'.tr(),
      'isAdd': false,
    },
  ];
  List favourite = [];
  List getYeuThic() {
    for (var element in dichVu) {
      if (element['isAdd'] == true) {
        favourite.add(element);
      }
      print(favourite);
    }
    print('List b $favourite');
    return favourite;
  }

  List danhMucItems() {
    List a = [];
    List danhMucCopy = dichVu;
    for (var element in danhMucCopy) {
      element['isAdd'] = false;
      a.add(element);
    }
    return a;
  }

  void addDichVu(item) {
    favourite.add(item);
  }

  void delereDichVu(String title) {
    favourite.removeWhere((element) => element['title'] == title);
  }
}
