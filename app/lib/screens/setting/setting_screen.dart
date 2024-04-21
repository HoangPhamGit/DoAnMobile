import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/biometric_authentication/OTP_bio.dart';
import 'package:app/screens/buy_phone_card/widgets/build_bottomsheet.dart';
import 'package:app/screens/setting/setting_change_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'widgets/menu_item.dart';
import 'package:app/globals.dart' as globals;

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => SettingChangeNotifier(),
      child: const SettingScreen(),
    );
  }

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeProvider.themeOf(context).data.colorScheme.background,
      child: Stack(
        children: [
          Container(
            color: ThemeProvider.themeOf(context).data.primaryColor,
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/images/bg_header.png",
                color: ThemeProvider.themeOf(context).data.primaryColor,
                colorBlendMode: BlendMode.overlay,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            left: 0,
            right: 0,
            child: _buildHeader(context),
          ),
          Positioned.fill(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                decoration: BoxDecoration(
                  color: ThemeProvider.themeOf(context)
                      .data
                      .colorScheme
                      .background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Text(
                      "main-menu.setting.account".tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/account_info.svg",
                      title: "main-menu.setting.personal-information".tr(),
                      onPressed: () {
                        if (globals.navigatorContext != null) {
                          Navigator.of(globals.navigatorContext!)
                              .pushNamed(AppRoutesConst.thongTinCaNhan);
                        }
                      },
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_bank.svg",
                      title: "main-menu.setting.bank-management".tr(),
                      onPressed: () {
                        ///
                      },
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_bill.svg",
                      title: "main-menu.setting.manage-invoices".tr(),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(AppRoutesConst.billmanaged);
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "main-menu.setting.security".tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_change_pin.svg",
                      title: "main-menu.setting.change-pin".tr(),
                      onPressed: () {
                        ///
                      },
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_change_pass.svg",
                      title: "main-menu.setting.change-password".tr(),
                      onPressed: () {
                        if (globals.navigatorContext != null) {
                          Navigator.of(globals.navigatorContext!)
                              .pushNamed(AppRoutesConst.doiMatKhau);
                        }
                      },
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_login_via_bio.svg",
                      title: "main-menu.setting.login-via-bio".tr(),
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
                            if (_switchValue) {
                              buildBottomSheet(
                                  context: context,
                                  bottomSheet: const OTPBio(
                                    phoneNumber: '0123456789',
                                  ),
                                  size: 587 / 812);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "main-menu.setting.utilities".tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_introduce.svg",
                      title: "main-menu.setting.introduce".tr(),
                      onPressed: () {
                        ///
                      },
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_terms.svg",
                      title: "main-menu.setting.terms".tr(),
                      onPressed: () {
                        ///
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "main-menu.setting.other".tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_help.svg",
                      title: "main-menu.setting.help".tr(),
                      onPressed: () {
                        ///
                      },
                    ),
                    MenuItem(
                      svgIconPath: "assets/images/svg/mn_logout.svg",
                      title: "main-menu.setting.logout".tr(),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 0.05,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: svgAvatarDefault(),
                  ),
                  // child: filePath == null
                  //     ? Padding(
                  //         padding: const EdgeInsets.all(8),
                  //         child: svgAvatarDefault(),
                  //       )
                  //     : ClipOval(
                  //         child: Image.file(
                  //           File(filePath!),
                  //           fit: BoxFit.cover,
                  //           width: width,
                  //           height: height,
                  //           errorBuilder: (context, error, stackTrace) {
                  //             return svgAvatarDefault();
                  //           },
                  //         ),
                  //       ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Lê Trọng Linh",
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "0333333333",
                        textAlign: TextAlign.left,
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .bodySmall!
                            .copyWith(
                              color: Colors.white.withOpacity(0.7),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  SvgPicture svgAvatarDefault() {
    return SvgPicture.asset(
      "assets/images/svg/avatar_default.svg",
      color: Colors.white,
      fit: BoxFit.fill,
    );
  }
}
