import 'dart:math';

import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/lien_ket_ngan_hang/notifiers/nhap_thong_tin_change_notifier.dart';
import 'package:app/modules/lien_ket_ngan_hang/widgets/snackbar.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class NhapThongTinThe extends StatefulWidget {
  const NhapThongTinThe({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
        create: (_) => NhapThongTinChangeNotifier(),
        child: const NhapThongTinThe());
    //return const NhapThongTinThe();
  }

  @override
  State<NhapThongTinThe> createState() => _NhapThongTinTheState();
}

class _NhapThongTinTheState extends State<NhapThongTinThe> {
  LoadingTextButtonController btnController = LoadingTextButtonController();
  LoadingTextButtonController otpBtnController = LoadingTextButtonController();
  late NhapThongTinChangeNotifier _notifier = NhapThongTinChangeNotifier();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _notifier = context.read<NhapThongTinChangeNotifier>();
      _notifier.hieuLucTime();
    });

    //initHieuLuc();
    super.initState();
  }

  void initHieuLuc() {
    _notifier.hieuLucController.text = '--/--';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'link-card.title.nhap-tt'.tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.01),
                  color: const Color.fromRGBO(52, 133, 32, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/techcombank_icon.png',
                    width: 29.33,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Text(
                    'link-card.title.so-the'.tr(),
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodySmall!
                        .copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const FssTextField(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 6, right: 6),
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'link-card.title.ten-chu'.tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white.withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const FssTextField(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 8, left: 6, right: 6),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'link-card.title.hieu-luc'.tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white.withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Stack(
                              children: [
                                Consumer<NhapThongTinChangeNotifier>(
                                  builder: (context, value, child) {
                                    return FssTextField(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8, left: 6, right: 6),
                                      controller: _notifier.hieuLucController,
                                      textInputType: TextInputType.number,
                                    );
                                  },
                                ),
                                Positioned(
                                  top: 8,
                                  left: 65,
                                  child: InkWell(
                                    onTap: () {
                                      showMonthPicker(context,
                                          onSelected: (month, year) {
                                        _notifier.setDate(month, year);
                                        _notifier.hieuLucTime();
                                      },
                                          initialSelectedMonth: _notifier.month,
                                          initialSelectedYear: _notifier.year,
                                          firstEnabledMonth: 1,
                                          lastEnabledMonth: 12,
                                          firstYear: 2022,
                                          lastYear: 2100,
                                          selectButtonText: 'OK',
                                          cancelButtonText: 'cancel',
                                          highlightColor:
                                              Colors.purple.withOpacity(0.8),
                                          textColor: Colors.black,
                                          contentBackgroundColor: Colors.white,
                                          dialogBackgroundColor:
                                              Colors.grey[200]);
                                    },
                                    child: Transform.rotate(
                                      angle: pi / 2,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(BorderSide(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.05))),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'link-card.content.nhap-tt'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(3, 14, 38, 0.4)),
              ),
            ),
            const Spacer(),
            LoadingTextButton(
                controller: btnController,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      isDismissible: false,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(24))),
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.8,
                          child: buildOtpLienket(context, otpBtnController),
                        );
                      });
                },
                title: 'link-card.button.next'.tr())
          ],
        ),
      ),
    );
  }
}

Future buildBottomSheet(
    {required context, required bottomSheet, double? size}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: size ?? 0.7,
          child: bottomSheet,
        );
      });
}

Widget buildOtpLienket(
  BuildContext context,
  LoadingTextButtonController btnController,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Container(
          width: 40,
          height: 4,
          color: const Color.fromRGBO(216, 218, 229, 1),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'link-card.title.otp'.tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'link-card.content.nhap-ma'.tr(),
          textAlign: TextAlign.center,
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodySmall!
              .copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(3, 14, 38, 0.7)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              FssTextField(
                hintText: 'link-card.content.otp'.tr(),
                textInputType: TextInputType.number,
                padding: const EdgeInsets.only(
                    top: 13, bottom: 13, right: 16, left: 16),
              ),
              const SizedBox(
                height: 40,
              ),
              LoadingTextButton(
                  controller: btnController,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppRoutesConst.quanLyLienKet);
                    ScaffoldMessenger.of(context).showSnackBar(
                        buildErrorSnackBar(
                            context, 'link-card.content.that-bai'.tr()));
                  },
                  title: 'link-card.button.otp'.tr())
            ],
          ),
        )
      ],
    ),
  );
}
