import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/screens/qr_scan_screen/widgets/build_qr_bot_sheet.dart';
import 'package:app/screens/qr_scan_screen/widgets/xac_nhan_chuyen_tien_bottom_sheet.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class ChuyenTienPage extends StatelessWidget {
  const ChuyenTienPage({super.key});
  static Widget create() {
    return const ChuyenTienPage();
  }

  @override
  Widget build(BuildContext context) {
    LoadingTextButtonController loadTextButtonController =
        LoadingTextButtonController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'QR.title.chuyen-tien'.tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(
                  color: const Color.fromRGBO(3, 14, 38, 1),
                  fontWeight: FontWeight.w700),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color.fromARGB(255, 0, 0, 0),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Column(
          children: [
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 16, right: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: const Border.fromBorderSide(BorderSide(
                      width: 1, color: Color.fromRGBO(22, 88, 228, 0.55))),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(22, 88, 228, 0.05),
                        blurStyle: BlurStyle.inner)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${'QR.content.so-du'.tr()} ${'QR.content.flexpay'.tr()}'),
                      Text.rich(TextSpan(text: '12.392.339', children: [
                        TextSpan(
                            text: 'QR.content.vnd'.tr(),
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: const Color.fromRGBO(22, 88, 228, 1),
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline))
                      ]))
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(22, 88, 228, 1)),
                    child: SvgPicture.asset(
                      "assets/images/svg/logo.svg",
                      height: 28,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 16, right: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: const Border.fromBorderSide(BorderSide(
                    width: 1, color: Color.fromRGBO(230, 230, 230, 1))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('QR.content.so-tk'.tr()),
                      const Text.rich(
                          TextSpan(text: '01234567890', children: []))
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      "assets/images/svg/phone_book.svg",
                      height: 24,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 16, right: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: const Border.fromBorderSide(BorderSide(
                      width: 1, color: Color.fromRGBO(230, 230, 230, 1))),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(244, 244, 244, 1),
                        blurStyle: BlurStyle.inner)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('QR.content.ten-tk'.tr()),
                      const Text.rich(
                          TextSpan(text: 'Nguyễn Văn A', children: []))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FssTextField(
              hintText: 'QR.content.so-tien-chuyen'.tr(),
            ),
            const SizedBox(
              height: 16,
            ),
            FssTextField(
              hintText: 'QR.content.noi-dung'.tr(),
            ),
            const Spacer(),
            LoadingTextButton(
              controller: loadTextButtonController,
              onPressed: () {
                buildBottomSheet(
                    size: 0.68,
                    context: context,
                    bottomSheet: const XacNhanChuyenTien());
              },
              title: 'QR.button.next'.tr(),
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
