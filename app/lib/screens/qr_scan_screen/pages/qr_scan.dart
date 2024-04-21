import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/qr_scan_screen/widgets/logo_bank.dart';
import 'package:app/screens/qr_scan_screen/widgets/overlay_qr_scan.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:theme_provider/theme_provider.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});
  static Widget create() {
    return const QRScannerPage();
  }

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  MobileScannerController mobileScanner = MobileScannerController();
  bool _screenOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(22, 88, 228, 1),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                mobileScanner.toggleTorch();
              },
              color: Colors.transparent,
              icon: ValueListenableBuilder(
                  valueListenable: mobileScanner.torchState,
                  builder: (context, state, child) {
                    switch (state) {
                      case TorchState.off:
                        return Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/images/svg/flash_off.svg',
                            fit: BoxFit.cover,
                          ),
                        );
                      case TorchState.on:
                        return Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/images/svg/flash_on.svg',
                            fit: BoxFit.cover,
                          ),
                        );
                    }
                  })),
          IconButton(
            onPressed: () {},
            icon: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/svg/add_photo_alternate.svg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            controller: mobileScanner,
            onDetect: _foundCode,
          ),
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(0.4),
          ),
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Text(
                    'QR.title.qr-scan'.tr(),
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'QR.title.huong-dan'.tr(),
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ],
              )),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.7,
            left: MediaQuery.of(context).size.width / 5.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildBankWidget(logoBank: 'assets/images/viet_qr_logo.png'),
                const SizedBox(
                  width: 6,
                ),
                buildBankWidget(logoBank: 'assets/images/naspas_247_logo.png'),
                const SizedBox(
                  width: 6,
                ),
                buildBankWidget(logoBank: 'assets/images/vnpay_logo.png')
              ],
            ),
          )
        ],
      ),
    );
  }

  void _foundCode(Barcode barcode, MobileScannerArguments? args) {
    print(barcode);
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? '...';
      print(code);
      _screenOpened = false;
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          Navigator.pushNamed(
            context,
            AppRoutesConst.chuyenTien,
          );
        }
      });
    }
  }

  void screenClosed() {
    _screenOpened = false;
  }
}
