import 'package:app/screens/qr_scan_screen/pages/qr_cua_toi_page.dart';
import 'package:app/screens/qr_scan_screen/pages/qr_scan.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:theme_provider/theme_provider.dart';

class QRScranScreen extends StatefulWidget {
  const QRScranScreen({super.key});
  static Widget create() {
    return const QRScranScreen();
  }

  @override
  State<QRScranScreen> createState() => _QRScranScreenState();
}

class _QRScranScreenState extends State<QRScranScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: AppBar(
          //   centerTitle: true,
          //   elevation: 0,
          //   backgroundColor: const Color.fromRGBO(22, 88, 228, 1),
          //   leading: InkWell(
          //       onTap: () {
          //         Navigator.of(context).pop();
          //       },
          //       child: const Icon(
          //         Icons.arrow_back,
          //         size: 24,
          //         color: Colors.white,
          //       )),
          //   actions: [
          //     Container(
          //       width: 24,
          //       height: 24,
          //       alignment: Alignment.center,
          //       child: SvgPicture.asset(
          //         'assets/images/svg/flash_on.svg',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 12,
          //     ),
          //     Container(
          //       width: 24,
          //       height: 24,
          //       alignment: Alignment.center,
          //       child: SvgPicture.asset(
          //         'assets/images/svg/add_photo_alternate.svg',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 16,
          //     ),
          //   ],
          // ),
          body: Stack(
            children: [
              TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [QRScannerPage.create(), QRCuaToiPage.create()]),
              Positioned(
                bottom: 31,
                left: 48,
                child: Container(
                  width: MediaQuery.of(context).size.width - 96,
                  height: 48,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: TabBar(
                      indicator: BoxDecoration(
                        color: const Color.fromRGBO(22, 88, 228, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      unselectedLabelColor:
                          const Color.fromRGBO(3, 14, 38, 0.4),
                      unselectedLabelStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodySmall!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      labelColor: Colors.white,
                      labelStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodySmall!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      tabs: [
                        Text('QR.button.scan'.tr()),
                        Text('QR.button.qr-code'.tr())
                      ]),
                ),
              ),
            ],
          )),
    );
  }
}
