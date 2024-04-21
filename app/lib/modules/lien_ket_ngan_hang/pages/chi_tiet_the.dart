import 'package:app/modules/lien_ket_ngan_hang/widgets/lien_ket_func_item.dart';
import 'package:app/modules/lien_ket_ngan_hang/widgets/snackbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ChiTietThe extends StatefulWidget {
  const ChiTietThe({super.key});
  static Widget create() {
    return const ChiTietThe();
  }

  @override
  State<ChiTietThe> createState() => _ChiTietTheState();
}

class _ChiTietTheState extends State<ChiTietThe> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 50, 3, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(12, 50, 3, 1),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 34, right: 34),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.01),
                color: const Color.fromRGBO(52, 133, 32, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/techcombank_icon.png',
                  width: 29.33,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  '5532 •••• •••• 2882',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                        Text(
                          'Nguyen Van A',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 44,
                    ),
                    Column(
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
                        Text(
                          '04/28',
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'link-card.title.chuc-nang'.tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(3, 14, 38, 1)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    LienKetFuncItem(
                      iconPath: 'assets/images/dat_mac_dinh_lien_ket.png',
                      textColor: Colors.black,
                      title: 'link-card.button.mac-dinh'.tr(),
                      suffixWidget: Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: _switchValue,
                          activeColor:
                              ThemeProvider.themeOf(context).data.primaryColor,
                          onChanged: (bool value) {
                            setState(() {
                              _switchValue = value;
                            });
                            if (_switchValue == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  buildErrorSnackBar(context,
                                      'link-card.content.that-bai'.tr()));
                              //      ScaffoldMessenger.of(context).showSnackBar(
                              // buildSuccessSnackBar(context,
                              //     'link-card.content.thanh-cong'.tr()));
                            }
                          },
                        ),
                      ),
                    ),
                    LienKetFuncItem(
                      iconPath: 'assets/images/xoa_the_lien_ket.png',
                      textColor: const Color.fromRGBO(249, 62, 62, 1),
                      title: 'link-card.button.xoa'.tr(),
                      suffixWidget: Container(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
