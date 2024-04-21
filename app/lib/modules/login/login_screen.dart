import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/login/login_change_notifier.dart';
import 'package:app/modules/login/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => LoginChangeNotifier(),
      child: const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginChangeNotifier _notifier;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    _notifier = context.read<LoginChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff071E52),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.6,
              right: 0,
              left: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300,
                  child: Image.asset(
                    "assets/images/ads1.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
                padding: EdgeInsets.only(
                  top: 24,
                  right: 24,
                  left: 24,
                  bottom: MediaQuery.of(context).viewPadding.bottom + 8,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "${"login.title".tr()},\n${"login.start-using".tr()}",
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 24),
                      LoginTextField(
                        controller: usernameController,
                        prefixIcon: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/svg/username-login.svg",
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                        hintText:
                            "${"login.phone-number".tr()}/${"login.username".tr()}",
                      ),
                      const SizedBox(height: 12),
                      LoginTextField(
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
                        hintText: "login.password".tr(),
                        password: true,
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutesConst.forgotPassword,
                            (route) => false,
                          );
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
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutesConst.mainMenu,
                            (route) => false,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            return const Color(0xff4AF1E7); // Default padding
                          }),
                          padding:
                              MaterialStateProperty.resolveWith<EdgeInsets>(
                                  (states) {
                            return const EdgeInsets.symmetric(
                              vertical: 11,
                              horizontal: 16,
                            ); // Default padding
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: Text(
                          "login.title".tr(),
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .titleSmall,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "login.log-in-another-way".tr(),
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color: Colors.white.withOpacity(0.7),
                            ),
                      ),
                      const SizedBox(height: 24),
                      OtherLoginButton(
                        onPressed: () {},
                        title: "Facebook",
                        prefixIconPath: "assets/images/facebook.png",
                      ),
                      const SizedBox(height: 12),
                      OtherLoginButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutesConst.xacThuc);
                        },
                        title: "Zalo",
                        prefixIconPath: "assets/images/zalo.png",
                      ),
                      const SizedBox(height: 24),
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
                                  Navigator.of(context).pushNamed(
                                    AppRoutesConst.register,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
