import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/screens/qr_scan_screen/widgets/build_qr_bot_sheet.dart';
import 'package:app/screens/qr_scan_screen/widgets/pin_code_bottom_sheet.dart';
import 'package:app/screens/qr_scan_screen/widgets/xac_nhan_chuyen_tien_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class XacNhanChuyenTien extends StatelessWidget {
  const XacNhanChuyenTien({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingTextButtonController btnController = LoadingTextButtonController();
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'QR.title.xac-nhan'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleMedium!
                      .copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset('assets/images/svg/cancel_x.svg'))
              ],
            ),
            const Divider(
              thickness: 1,
              height: 16,
              color: Color.fromRGBO(0, 0, 0, 0.05),
            ),
            Text(
              'QR.title.nguon-tien'.tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleSmall!
                  .copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: const Border.fromBorderSide(BorderSide(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.05)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(22, 88, 228, 1)),
                    child: SvgPicture.asset(
                      'assets/images/svg/logo.svg',
                      height: 28,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'QR.content.flexpay'.tr(),
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleSmall!
                            .copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text.rich(TextSpan(
                          text: '${'QR.content.so-du'.tr()}: ',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(3, 14, 38, 0.4)),
                          children: [
                            TextSpan(
                              text: '123123123',
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(3, 14, 38, 0.4)),
                            ),
                            TextSpan(
                              text: 'QR.content.vnd'.tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(3, 14, 38, 0.4)),
                            )
                          ]))
                    ],
                  ),
                  const Spacer(),
                  Transform(
                    transform: Matrix4.translationValues(0, -4, 0),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 16,
              color: Color.fromRGBO(0, 0, 0, 0.05),
            ),
            buildXacNhanBotShItem(
                context: context,
                title: 'QR.content.so-tk'.tr(),
                text: '00902390933',
                textColor: Colors.black),
            const Divider(
              thickness: 1,
              height: 16,
              color: Color.fromRGBO(0, 0, 0, 0.05),
            ),
            buildXacNhanBotShItem(
                context: context,
                title: 'QR.content.ten-tk'.tr(),
                text: 'Nguyen Van A',
                textColor: Colors.black),
            const Divider(
              thickness: 1,
              height: 16,
              color: Color.fromRGBO(0, 0, 0, 0.05),
            ),
            buildXacNhanBotShItem(
                context: context,
                title: 'QR.content.noi-dung'.tr(),
                text: 'Nguyen van a chuyen tien an trua',
                textColor: Colors.black),
            const Divider(
              thickness: 1,
              height: 16,
              color: Color.fromRGBO(0, 0, 0, 0.05),
            ),
            buildXacNhanBotShItem(
                context: context,
                title: 'QR.content.phi'.tr(),
                text: 'Mien phi',
                textColor: const Color.fromRGBO(22, 88, 228, 1)),
            const Divider(
              thickness: 1,
              height: 16,
              color: Color.fromRGBO(0, 0, 0, 0.05),
            ),
            buildXacNhanBotShItem(
                context: context,
                title: 'QR.content.tong-tien'.tr(),
                text: '00902390933',
                textColor: Colors.black),
            const Spacer(),
            LoadingTextButton(
                controller: btnController,
                onPressed: () {
                  buildBottomSheet(
                      size: 0.7,
                      context: context,
                      bottomSheet: const BuildPinCode());
                },
                title: 'QR.button.confirm'.tr())
          ]),
    );
  }
}
