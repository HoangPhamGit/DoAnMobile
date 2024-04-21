import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/modules/register/build_bottom_sheet.dart';
import 'package:app/screens/qr_scan_screen/notifier/qr_scan_notifier.dart';
import 'package:app/screens/qr_scan_screen/widgets/logo_bank.dart';
import 'package:app/screens/qr_scan_screen/widgets/them_tien_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class QRCuaToiPage extends StatefulWidget {
  const QRCuaToiPage({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => QRScanChangeNotifier(),
      child: const QRCuaToiPage(),
    );
  }

  @override
  State<QRCuaToiPage> createState() => _QRCuaToiPageState();
}

class _QRCuaToiPageState extends State<QRCuaToiPage> {
  late LoadingTextButtonController btnController;
  late TextEditingController textController;
  late QRScanChangeNotifier _notifier;

  String myMoney = '';
  @override
  void initState() {
    btnController = LoadingTextButtonController();
    textController = TextEditingController();
    _notifier = context.read<QRScanChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(22, 88, 228, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(22, 88, 228, 1),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/svg/share_qr_cua_toi.svg",
              height: 24,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'QR.title.share'.tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleLarge!
                  .copyWith(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Nguyễn Văn A',
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium!
                  .copyWith(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w600),
            ),
            Text(
              '${'QR.content.flexpay'.tr()} 090803030333',
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodySmall!
                  .copyWith(
                      color: const Color.fromRGBO(255, 255, 255, 0.7),
                      fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
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
            const SizedBox(
              height: 16,
            ),
            // QR
            Container(
              width: 280,
              height: 280,
              padding: const EdgeInsets.all(30.27),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(35, 55, 98, 1),
                    Color.fromRGBO(6, 18, 43, 1)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(24)),
              child: Image.asset('assets/images/qr_code.png'),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                buildBottomSheet(
                  size: 0.6,
                  context: context,
                  bottomSheet: buildThemTienBotSheet(
                      context: context,
                      btnController: btnController,
                      textController: textController,
                      notifier: _notifier),
                );
              },
              child: Consumer<QRScanChangeNotifier>(
                builder: (context, qrChangenoti, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      qrChangenoti.formatedMoney == ''
                          ? Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(74, 241, 231, 1)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'QR.content.them-tien'.tr(),
                                  style: ThemeProvider.themeOf(context)
                                      .data
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: const Color.fromRGBO(
                                              74, 241, 231, 1),
                                          fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          : Row(
                              children: [
                                Text.rich(TextSpan(
                                    text: 'QR.content.so-tien-nhan'.tr(),
                                    style: ThemeProvider.themeOf(context)
                                        .data
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.7),
                                            fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: ': ${qrChangenoti.formatedMoney}',
                                        style: ThemeProvider.themeOf(context)
                                            .data
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                      ),
                                      TextSpan(
                                        text: 'QR.content.vnd'.tr(),
                                        style: ThemeProvider.themeOf(context)
                                            .data
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                      )
                                    ])),
                                const SizedBox(
                                  width: 4,
                                ),
                                InkWell(
                                  onTap: () {
                                    qrChangenoti.deleteMoney();
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.5),
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                      'assets/images/svg/cancel_x.svg',
                                      color: Colors.white,
                                      height: 20,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
