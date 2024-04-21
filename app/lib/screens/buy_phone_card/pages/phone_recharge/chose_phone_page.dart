import 'package:app/components/components.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/bill_screen/widgets/build_bottom_sheet.dart';
import 'package:app/screens/buy_phone_card/modal_bottom_sheet/confirm_bottom_sheet.dart';
import 'package:app/screens/buy_phone_card/modules/buy_card_changenotifier.dart';
import 'package:app/screens/buy_phone_card/widgets/list_gia_nap.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;

class ChosePhonePage extends StatefulWidget {
  const ChosePhonePage({
    super.key,
  });

  // static Widget create() {
  //   return ChosePhonePage();
  // }

  @override
  State<ChosePhonePage> createState() => _ChosePhonePageState();
}

class _ChosePhonePageState extends State<ChosePhonePage> {
  late TextEditingController controller;
  LoadingTextButtonController buttonController = LoadingTextButtonController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int selectedIndex = -1;
  bool hasError = false;
  String currentText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    buttonController = LoadingTextButtonController();
    controller.text = '0362580330';
    print('init state');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 24, bottom: 30, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'top-up-phone.phone-number'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff030E26)),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 72,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: hasError
                            ? const Color(0xffEC1D25)
                            : const Color(0xff1658E4),
                        width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.asset('assets/images/ic_vettel.png'),
                    ),
                    SizedBox(
                      width: 200,
                      height: 48,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Selector<BuyPhoneCardChangenotifier,
                              Map<String, dynamic>>(
                            selector: (p0, p1) => p1.object,
                            shouldRebuild: (previous, next) => true,
                            builder: (context, user, child) {
                              if (user.isEmpty) {
                                user['nameUser'] = 'Số của tôi';
                              }
                              return Text(
                                user['nameUser'],
                                style: ThemeProvider.themeOf(context)
                                    .data
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: const Color(0xff030E26)
                                            .withOpacity(0.4),
                                        fontWeight: FontWeight.w400),
                              );
                            },
                          ),
                          SizedBox(
                            child: Form(
                              key: formkey,
                              child: FssTextField(
                                controller: controller,
                                textInputType: TextInputType.number,
                                // validator: (value) {
                                //   if (value!.length < 10) {
                                //     return 'Số điện thoại không hợp lệ';
                                //   }
                                //   return null;
                                // },
                                onChange: (value) {
                                  currentText = value;
                                  if (currentText.length < 10) {
                                    setState(() {
                                      hasError = true;
                                    });
                                  } else {
                                    setState(() {
                                      hasError = false;
                                    });
                                  }
                                  // print(currentText);
                                },
                                border: InputBorder.none,
                                padding: const EdgeInsets.all(0),
                                textStyle: ThemeProvider.themeOf(context)
                                    .data
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: const Color(0xff030E26),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (globals.navigatorContext != null) {
                          Navigator.of(globals.navigatorContext!)
                              .pushNamed(AppRoutesConst.danhBa);
                        }
                      },
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(
                          'assets/images/svg/ic_danh_ba.svg',
                          color: const Color(0xff1658E4),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (hasError)
                Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: SvgPicture.asset(
                              'assets/images/svg/ic_error.svg'),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text('top-up-phone.error'.tr(),
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffEC1D25))),
                      ],
                    ),
                  ],
                ),
              Divider(
                thickness: 1,
                height: 32,
                color: const Color(0xff000000).withOpacity(0.05),
              ),
              ListGiaNap(
                title: 'top-up-phone.denominations'.tr(),
              )
            ],
          ),
          LoadingTextButton(
            controller: buttonController,
            onPressed: () {
              //formkey.currentState!.validate()
              if (hasError == false) {
                buildBottomSheet(
                    context: context,
                    bottomSheet: const BuyPhoneCardBottom(),
                    size: 443 / 812);
              }
            },
            borderRadius: BorderRadius.circular(8),
            title: 'top-up-phone.continue'.tr(),
            textStyle: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          )
        ],
      ),
    );
  }
}
