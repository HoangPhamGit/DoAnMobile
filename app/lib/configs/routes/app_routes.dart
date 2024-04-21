import 'package:app/modules/account_notification/notification.dart';
import 'package:app/modules/cash_in/cash_in_screen.dart';
import 'package:app/modules/dich_vu/dich_vu_screen.dart';
import 'package:app/modules/forgot_password/forgot_password_screen.dart';
import 'package:app/modules/forgot_password/page/rebuild_login_screen.dart';
import 'package:app/modules/lien_ket_ngan_hang/pages/lien_ket_the.dart';
import 'package:app/modules/lien_ket_ngan_hang/pages/nhap_thong_tin_the.dart';
import 'package:app/modules/lien_ket_ngan_hang/quan_ly_lien_ket_ngan_hang.dart';
import 'package:app/modules/lien_ket_ngan_hang/pages/chi_tiet_the.dart';
import 'package:app/modules/login/login_screen.dart';
import 'package:app/modules/quan_ly_dich_vu/quan_ly_dich_vu.dart';
import 'package:app/modules/register/pages/success_register_page.dart';
import 'package:app/modules/register/register_screen.dart';
import 'package:app/modules/thong_tin_ca_nhan/thong_tin_ca_nhan.dart';
import 'package:app/modules/xac_thuc_giay_to/xac_thuc_giay_to.dart';
import 'package:app/screens/bill_screen/bill_page/bill_success.dart';
import 'package:app/screens/bill_screen/bill_screen.dart';

import 'package:app/modules/wallet_account/tai_khoan_vi_dien_tu.dart';
import 'package:app/screens/buy_phone_card/buy_phone_card.dart';
import 'package:app/screens/buy_phone_card/pages/chi_tiet_gd.dart';
import 'package:app/screens/buy_phone_card/pages/mua_the_dt/khuyen_mai.dart';
import 'package:app/screens/buy_phone_card/pages/phone_recharge/danh_ba_screen.dart';

import 'package:app/screens/main_menu/main_menu_screen.dart';
import 'package:app/screens/onboarding/onboarding_screen.dart';
import 'package:app/screens/qr_scan_screen/pages/chuyen_tien_page.dart';
import 'package:app/screens/qr_scan_screen/qr_scan_screen.dart';
import 'package:flutter/material.dart';
import '../../screens/splash/splash_screen.dart';
import 'app_routes_const.dart';

class AppRoutes {
  static Route? onGenerateRoutes(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesConst.splashScreen:
        return _materialRoute(settings, SplashScreen.create());
      case AppRoutesConst.onBoarding:
        return _materialRoute(settings, OnBoardingScreen.create());
      case AppRoutesConst.login:
        return _materialRoute(settings, LoginScreen.create());
      case AppRoutesConst.mainMenu:
        return _materialRoute(settings, MainMenuScreen.create());
      case AppRoutesConst.register:
        return _materialRoute(settings, RegisterScreen.create());
      case AppRoutesConst.successRegister:
        return _materialRoute(settings, SuccessRegisterPage.create());

      case AppRoutesConst.forgotPassword:
        return _materialRoute(settings, ForgotPasswordScreen.create());
      case AppRoutesConst.reLogin:
        return _materialRoute(settings, RebuildLogin.create());
      case AppRoutesConst.billmanaged:
        return _materialRoute(settings, BillScreen.create());
      case AppRoutesConst.billSuccess:
        return _materialRoute(settings, BillSuccessPage.create());
      // case AppRoutesConst.billInfor:
      //   return _materialRoute(settings, BillInformationPage.create());
      // case AppRoutesConst.billSelectService:
      //   return _materialRoute(settings, SelectService.create());

      case AppRoutesConst.accountNotification:
        return _materialRoute(settings, AccountNotification.create());
      case AppRoutesConst.taiKhoanVi:
        return _materialRoute(settings, TaiKhoanViDienTu.create());
      case AppRoutesConst.quanLyDichVu:
        return _materialRoute(settings, QuanLyDichVu.create());
      case AppRoutesConst.qrSacan:
        return _materialRoute(settings, QRScranScreen.create());
      case AppRoutesConst.chuyenTien:
        return _materialRoute(settings, ChuyenTienPage.create());
      case AppRoutesConst.quanLyLienKet:
        return _materialRoute(settings, QuanLyLienKet.create());
      case AppRoutesConst.chiTietThe:
        return _materialRoute(settings, ChiTietThe.create());
      case AppRoutesConst.lienKetThe:
        return _materialRoute(settings, LienKetTheNH.create());
      case AppRoutesConst.nhapThongTinThe:
        return _materialRoute(settings, NhapThongTinThe.create());
      //
      case AppRoutesConst.buyPhoneCard:
        return _materialRoute(settings, BuyPhoneCardScreen.create());
      case AppRoutesConst.danhBa:
        return _materialRoute(settings, DanhBaScreen.create());
      case AppRoutesConst.chiTietGD:
        return _materialRoute(settings, ChiTietGiaoDich.create());
      case AppRoutesConst.khuyenMai:
        return _materialRoute(settings, KhuyenMai.create());
      //
      case AppRoutesConst.dichVu:
        return _materialRoute(settings, DichVu.create());

      case AppRoutesConst.thongTinCaNhan:
        return _materialRoute(settings, ThongTinCaNhan.create());
      case AppRoutesConst.xacThuc:
        return _materialRoute(settings, XacThuc.create());

      case AppRoutesConst.cashIn:
        return _materialRoute(settings, CashInScreen.create());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings, Widget view,
      {bool fullscreenDialog = false}) {
    return MaterialPageRoute(
        builder: (context) => view,
        settings: settings,
        fullscreenDialog: fullscreenDialog);
  }
}
