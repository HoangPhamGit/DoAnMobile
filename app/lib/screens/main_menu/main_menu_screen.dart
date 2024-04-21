import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/main_menu/notifier/main_menu_change_notifier.dart';
import 'package:app/screens/promotion/promotion_screen.dart';
import 'package:app/screens/qr_scan_screen/qr_scan_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import '../../commons/message_manager.dart';
import '../setting/setting_screen.dart';
import '../transaction_history/transaction_history_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => MainMenuChangeNotifier(),
      child: const MainMenuScreen(),
    );
  }

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  late PersistentTabController _controller;
  late MainMenuChangeNotifier _notifier;
  @override
  void initState() {
    _notifier = context.read<MainMenuChangeNotifier>();
    _controller = PersistentTabController(initialIndex: 0);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _notifier.loadCustomer().catchError((err) {
        if (mounted) {
          MessageManager.onErrorDialog(context, err);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // endDrawer: const EndDrawerMenu(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(context),
        confineInSafeArea: true,
        items: _navBarItems(),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          colorBehindNavBar: const Color(0xff2A5CAA),
          borderRadius: BorderRadius.circular(0.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2,
            ),
          ],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        padding: const NavBarPadding.fromLTRB(8, 8, 4, 0),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 300),
        ),
        navBarHeight: 70,
        navBarStyle: NavBarStyle.style18,
        onItemSelected: (index) {
          ///
        },
      ),
    );
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      HomeScreen.create(),
      PromotionScreen.create(),
      QRScranScreen.create(),
      TransactionHistory.create(),
      SettingScreen.create(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      getNavItem(
        iconSvgPath: 'assets/images/svg/menu_trang_chu_notselect.svg',
        inActiveSvgPath: 'assets/images/svg/menu_trang_chu.svg',
        title: 'main-menu.bottom-nav-bar.home'.tr(),
      ),
      getNavItem(
        iconSvgPath: 'assets/images/svg/menu_khuyen_mai_notselect.svg',
        inActiveSvgPath: 'assets/images/svg/meunu_khuyen_mai.svg',
        title: 'main-menu.bottom-nav-bar.promotion'.tr(),
      ),
      _buildNavItemQrScan(
        context,
        onPressed: (context) {
          ///
        },
      ),
      getNavItem(
        iconSvgPath: 'assets/images/svg/menu_lich_su_notselect.svg',
        inActiveSvgPath: 'assets/images/svg/menu_lich_su.svg',
        title: 'main-menu.bottom-nav-bar.history'.tr(),
      ),
      getNavItem(
        iconSvgPath: 'assets/images/svg/menu_cai_dat_notselect.svg',
        inActiveSvgPath: 'assets/images/svg/menu_cai_dat.svg',
        title: 'main-menu.bottom-nav-bar.setting'.tr(),
      ),
    ];
  }

  PersistentBottomNavBarItem getNavItem({
    String? title,
    required String iconSvgPath,
    required String inActiveSvgPath,
    double? iconSize,
    Function(BuildContext?)? onPressed,
  }) {
    return PersistentBottomNavBarItem(
      title: title,
      textStyle: ThemeProvider.themeOf(context)
          .data
          .textTheme
          .titleSmall!
          .copyWith(fontSize: 12),
      iconSize: 24,
      icon: SvgPicture.asset(
        iconSvgPath,
        width: iconSize ?? 24,
        height: iconSize ?? 24,
      ),
      inactiveIcon: SvgPicture.asset(
        width: iconSize ?? 24,
        height: iconSize ?? 24,
        inActiveSvgPath,
      ),
      activeColorPrimary: ThemeProvider.themeOf(context).data.primaryColor,
      inactiveColorPrimary:
          ThemeProvider.themeOf(context).data.unselectedWidgetColor,
      onPressed: onPressed,
    );
  }

  PersistentBottomNavBarItem _buildNavItemQrScan(BuildContext context,
      {required Function(BuildContext?) onPressed}) {
    return PersistentBottomNavBarItem(
      icon: GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRoutesConst.qrSacan),
        child: Container(
          // padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: ThemeProvider.themeOf(context).data.primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/qr-code.gif",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      activeColorPrimary: Colors.transparent,
      onPressed: onPressed,
    );
  }
}
