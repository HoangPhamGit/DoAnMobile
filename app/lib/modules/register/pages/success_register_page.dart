import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class SuccessRegisterPage extends StatefulWidget {
  const SuccessRegisterPage({super.key});
  static Widget create() {
    return const SuccessRegisterPage();
  }

  @override
  State<SuccessRegisterPage> createState() => _SuccessRegisterPageState();
}

class _SuccessRegisterPageState extends State<SuccessRegisterPage> {
  bool isFinish = false;
  LoadingTextButtonController sinhtracBtn = LoadingTextButtonController();
  LoadingTextButtonController trangChuBtn = LoadingTextButtonController();

  @override
  void initState() {
    super.initState();
    delay();
  }

  void delay() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          isFinish = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff071E52),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/success_background.png",
            fit: BoxFit.fitWidth,
          ),
          AnimatedPositioned(
              top: isFinish
                  ? MediaQuery.of(context).size.height - 301
                  : MediaQuery.of(context).size.height,
              duration: const Duration(
                milliseconds: 1200,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 301,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(22, 88, 228, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'register.success-create-account'.tr(),
                      textAlign: TextAlign.center,
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: '${'register.login-account'.tr()}: ',
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.7),
                                ),
                            children: [
                              TextSpan(
                                text: '123456567',
                                style: ThemeProvider.themeOf(context)
                                    .data
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                              )
                            ])),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'register.login-biometrics'.tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    LoadingTextButton(
                      controller: sinhtracBtn,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutesConst.chonLoaiGiayTo);
                      },
                      borderColor: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30),
                      title: 'register.enable-biometrics'.tr(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    LoadingTextButton(
                      controller: trangChuBtn,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutesConst.mainMenu);
                      },
                      borderColor: const Color.fromRGBO(22, 88, 228, 1),
                      borderRadius: BorderRadius.circular(30),
                      backgroundColor: Colors.white,
                      textStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              fontSize: 16,
                              color: const Color.fromRGBO(22, 88, 228, 1),
                              fontWeight: FontWeight.w500),
                      title: 'register.start-login'.tr(),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
