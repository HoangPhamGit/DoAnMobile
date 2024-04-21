import 'package:app/screens/home_screen/home_screem_change_notifier.dart';
import 'package:app/screens/home_screen/pages/home_page_body.dart';
import 'package:app/screens/home_screen/pages/home_page_collapsed.dart';
import 'package:app/screens/home_screen/pages/home_page_expanded.dart';
import 'package:app/screens/home_screen/widget/home_screen_collaped_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sliver_snap/sliver_snap.dart';

class HomePageSliverSnap extends StatefulWidget {
  const HomePageSliverSnap({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenChangeNotifier(),
      child: const HomePageSliverSnap(),
    );
  }

  @override
  State<HomePageSliverSnap> createState() => _HomePageSliverSnapState();
}

class _HomePageSliverSnapState extends State<HomePageSliverSnap> {
  late HomeScreenChangeNotifier _notifier;

  @override
  void initState() {
    _notifier = context.read<HomeScreenChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverSnap(
          onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {
            _notifier.onCollapseStateChanged(scrollingOffset, isCollapsed);
          },
          collapsedBackgroundColor: const Color.fromRGBO(6, 68, 200, 1),
          expandedBackgroundColor: const Color.fromRGBO(6, 68, 200, 1),
          backdropWidget: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(6, 68, 200, 1),
          ),
          expandedContentHeight: MediaQuery.of(context).size.height * 0.36,
          expandedContent: const HomePageExpandedContent(),
          collapsedBarHeight: 112,
          collapsedContent: const HomePageCollapsed(),
          body: Container(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            child: const HomePageBody(),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: buildBottom(context))),
    );
  }
}

Widget buildBottom(BuildContext context) {
  return Opacity(
    opacity: context.watch<HomeScreenChangeNotifier>().opacity,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 6,
        bottom: 24,
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 24,
            ),
            BuildCollapsedButton(
              svgPath: 'assets/images/svg/home_screen_nap_tien.svg',
              text: 'home-screen.money-services.nap-tien'.tr(),
            ),
            const SizedBox(
              width: 16,
            ),
            BuildCollapsedButton(
              svgPath: 'assets/images/svg/home_screen_rut_tien.svg',
              text: 'home-screen.money-services.rut-tien'.tr(),
            ),
            const SizedBox(
              width: 16,
            ),
            BuildCollapsedButton(
              svgPath: 'assets/images/svg/home_screen_chuyen_tien.svg',
              text: 'home-screen.money-services.chuyen-tien'.tr(),
            ),
            const SizedBox(
              width: 16,
            ),
            BuildCollapsedButton(
              svgPath: 'assets/images/svg/home_screen_lien_ket.svg',
              text: 'home-screen.money-services.lien-ket'.tr(),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    ),
  );
}
