import 'package:app/configs/routes/app_routes_const.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ChupAnhKhuonMat extends StatefulWidget {
  const ChupAnhKhuonMat({super.key});

  static Widget create() {
    return const ChupAnhKhuonMat();
  }

  @override
  State<ChupAnhKhuonMat> createState() => _ChupAnhKhuonMatState();
}

class _ChupAnhKhuonMatState extends State<ChupAnhKhuonMat> {
  bool _screenOpened = false;
  MobileScannerController mobileScanner = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      MobileScanner(
        allowDuplicates: false,
        controller: mobileScanner,
        onDetect: _foundCode,
      ),
      ColorFiltered(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOut),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red, backgroundBlendMode: BlendMode.dstOut),
            ),
            Positioned(
              top: 129,
              left: 50,
              child: Container(
                height: 400,
                width: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
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
}
