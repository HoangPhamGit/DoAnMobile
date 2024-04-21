import 'package:flutter/material.dart';

class HomeScreenChangeNotifier extends ChangeNotifier {
  final imgPathPng = [
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_nap_tien.png',
      'title': 'Nạp tiền',
      'isPromo': false,
      'promotion': -5
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_chuyen_tien.png',
      'title': 'Chuyển tiền',
      'isPromo': false,
      'promotion': -5
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_khuyen_mai_cua_ban.png',
      'title': 'Khuyến mại của bạn',
      'isPromo': false,
      'promotion': -5
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_mua_the_dien_thoai.png',
      'title': 'Mua thẻ điện thoại',
      'isPromo': true,
      'promotion': -5
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_quan_li_the_nh.png',
      'title': 'Quản lý thẻ NH',
      'isPromo': false,
      'promotion': -5
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_quan_li_hoa_don.png',
      'title': 'Quản lý hóa đơn',
      'isPromo': false,
      'promotion': -5
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_hoa_don_dien.png',
      'title': 'Hóa đơn điện',
      'isPromo': false,
      'promotion': -5
    },
    {
      'imgPath': 'assets/images/dich_vu/dich_vu_hoa_don_nuoc.png',
      'title': 'Hóa đơn nước',
      'isPromo': true,
      'promotion': -5
    },
  ];

  double get expandedContentHeight => 300;
  double get collapsedBarHeight => 104;

  double _scrollingOffset = 0;
  double get scrollingOffset => _scrollingOffset;
  bool _isCollapsed = false;
  bool get isCollapsed => _isCollapsed;

  void onCollapseStateChanged(double scrollingOffset, bool isCollapsed) {
    _scrollingOffset = scrollingOffset;
    _isCollapsed = isCollapsed;
    notifyListeners();
  }

  double get calScrollingOffset =>
      (_scrollingOffset - (expandedContentHeight - collapsedBarHeight)) / 30;

  double get opacity => calScrollingOffset < 0
      ? 0
      : calScrollingOffset > 1
          ? 1
          : calScrollingOffset;
  List get getListItem => imgPathPng;

  bool isShow = false;

  void isShowHoaDon() {
    isShow = !isShow;
    notifyListeners();
  }
}
