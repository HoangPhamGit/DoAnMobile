import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/forgot_password/widgets/button_forgot_password.dart';
import 'package:app/modules/login/widgets/widgets.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class RebuildLogin extends StatefulWidget {
  const RebuildLogin({super.key});

  static Widget create() {
    return const RebuildLogin();
  }

  @override
  State<RebuildLogin> createState() => _RebuildLoginState();
}

class _RebuildLoginState extends State<RebuildLogin> {
  late final TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    //Show Snack bar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        content: SizedBox(
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff000000).withOpacity(0.3)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'forgot-password.password-changed-success'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        backgroundColor: const Color(0xff0ABD59),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    return Scaffold(
      backgroundColor: const Color(0xFF071E52),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 78,
              left: 43.52,
              right: 47.5,
              child: Container(
                width: 283.98,
                height: 179,
                decoration: BoxDecoration(
                    color: const Color(0xFF003AC6),
                    borderRadius: BorderRadius.circular(11.01)),
              ),
            ),
            Positioned(
                top: 98,
                left: 34,
                right: 37.98,
                child: Container(
                  width: 303.02,
                  height: 191,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.01),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/card_shape.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 28.11, left: 26),
                            width: 40.27,
                            height: 28.77,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.14)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.14),
                              child: Image.asset(
                                'assets/images/ic_chip.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 36.56, left: 13.23),
                            width: 10.8,
                            height: 14.17,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.14)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.14),
                              child: SvgPicture.asset(
                                'assets/images/svg/ic_connect.svg',
                                fit: BoxFit.cover,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 23.64, right: 26.34),
                        width: 21.23,
                        height: 34.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.14)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.14),
                          child: Image.asset(
                            'assets/images/vector.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              top: 185,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: 375,
                  height: 627,
                  decoration: const BoxDecoration(
                      color: Color(0xff1658E4),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${'forgot-password.hello'.tr()},\n${'forgot-password.user-name'.tr()}',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              // height: 1.5 * (36 / 24)
                            ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 48,
                        width: 327,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: FssTextField(
                          controller: passwordController,
                          prefixIcon: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/svg/password-login.svg",
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                          hintText: 'forgot-password.password'.tr(),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          //Quen mat khau
                          Navigator.pushNamedAndRemoveUntil(context,
                              AppRoutesConst.forgotPassword, (route) => false);
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutesConst.forgotPassword,
                                (route) => false);
                          },
                          child: Text(
                            "${"login.forgot-password".tr()}?",
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ButtonFogotPassword(
                        onpressed: () {},
                        buttonText: 'forgot-password.login'.tr(),
                        buttonColor: const Color(0xff4AF1E7),
                        textColor: const Color(0xff053532),
                        radius: 30,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ButtonFogotPassword(
                        showIcon: true,
                        onpressed: () {},
                        buttonText: 'forgot-password.use-FaceID'.tr(),
                        radius: 30,
                        buttonColor: Colors.white.withOpacity(0.3),
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'forgot-password.or-login-with'.tr(),
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      OtherLoginButton(
                          onPressed: () {},
                          title: 'forgot-password.facebook'.tr(),
                          prefixIconPath: "assets/images/facebook.png"),
                      const SizedBox(
                        height: 12,
                      ),
                      OtherLoginButton(
                          onPressed: () {},
                          title: 'forgot-password.zalo'.tr(),
                          prefixIconPath: "assets/images/zalo.png"),
                      const SizedBox(
                        height: 24,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "${"login.no-account".tr()}? ",
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Colors.white.withOpacity(0.7),
                              ),
                          children: [
                            TextSpan(
                              text: "login.register".tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  ///Mo tai khoan
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
