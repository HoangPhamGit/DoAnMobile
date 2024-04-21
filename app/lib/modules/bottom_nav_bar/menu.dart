import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
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
            borderRadius: BorderRadius.circular(0.0)),
        popAllScreensOnTapOfSelectedTab: true,
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
        // style nay da bi sua trong file thu vien goc
        navBarStyle: NavBarStyle.style18,
        onItemSelected: (index) {
          ///
        },
      ),
    );
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      getNavItem(
          iconSvgPath: 'assets/images/svg/trang_chu_menu_notselect.svg',
          inActiveSvgPath: 'assets/images/svg/menu_trang_chu.svg',
          title: 'Trang chủ'),
      getNavItem(
          iconSvgPath: 'assets/images/svg/menu_khuyen_mai_notselect.svg',
          inActiveSvgPath: 'assets/images/svg/meunu_khuyen_mai.svg',
          title: 'Khuyến Mãi'),
      getNavItem(
          iconSvgPath: 'assets/images/svg/menu_scan.svg',
          inActiveSvgPath: 'assets/images/svg/menu_scan.svg'),
      getNavItem(
          iconSvgPath: 'assets/images/svg/menu_lich_su_notselect.svg',
          inActiveSvgPath: 'assets/images/svg/menu_lich_su.svg',
          title: 'Lịch sử'),
      getNavItem(
          iconSvgPath: 'assets/images/svg/menu_cai_dat_notselect.svg',
          inActiveSvgPath: 'assets/images/svg/menu_cai_dat.svg',
          title: 'Cài đặt'),
    ];
  }

  PersistentBottomNavBarItem getNavItem({
    String? title,
    required String iconSvgPath,
    required String inActiveSvgPath,
    Function? onPressed,
  }) {
    return PersistentBottomNavBarItem(
      title: title,
      icon: SvgPicture.asset(
        iconSvgPath,
      ),
      inactiveIcon: SvgPicture.asset(
        inActiveSvgPath,
      ),
      activeColorPrimary: const Color.fromRGBO(22, 88, 228, 1),
      inactiveColorPrimary: const Color.fromRGBO(3, 14, 38, 0.4),
      onPressed: onPressed as dynamic Function(BuildContext?)?,
    );
  }
}
