import 'dart:async';

import 'package:app/configs/routes/app_routes_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Widget create() {
    return const SplashScreen();
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _logoVisible = false;
  bool _titleVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _logoVisible = true;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _titleVisible = true;
        });
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
                AppRoutesConst.onBoarding, ((route) => false));
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeProvider.themeOf(context).data.primaryColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _logoVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: SvgPicture.asset(
                    "assets/images/svg/logo.svg",
                    width: 50,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedOpacity(
                  opacity: _titleVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    "FlexPay",
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
