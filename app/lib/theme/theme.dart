import 'package:app/constants/font_const.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class AppThemeId {
  static const String dark = "dark";
  static const String light = "light";
  static const String premium = "light";
}

class AppThemeManager {
  static List<AppTheme> get themes {
    return [
      AppTheme(
        id: AppThemeId.light,
        description: "Light", // Description of theme
        data: ThemeData.light().copyWith(
          pageTransitionsTheme: _settingPageTransitionsTheme,
          primaryColor: const Color(0xff1658E4),
          colorScheme: const ColorScheme.light().copyWith(
            background: Colors.white,
            onBackground: const Color(0xffF5F5F5),
          ),
          dividerColor: const Color(0xff000000).withOpacity(0.05),
          focusColor: const Color(0xff1658E4),
          textTheme: TextTheme(
            headlineSmall: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: FontConst.beVietnamPro,
            ),
            headlineMedium: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: FontConst.beVietnamPro,
            ),
            headlineLarge: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: FontConst.beVietnamPro,
            ),
            titleSmall: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: FontConst.beVietnamPro,
            ),
            titleMedium: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: FontConst.beVietnamPro,
            ),
            titleLarge: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: FontConst.beVietnamPro,
            ),
            bodySmall: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 14,
              fontFamily: FontConst.beVietnamPro,
            ),
            bodyMedium: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 16,
              fontFamily: FontConst.beVietnamPro,
            ),
            bodyLarge: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 18,
              fontFamily: FontConst.beVietnamPro,
            ),
          ),
        ),
      ),
      AppTheme(
        id: AppThemeId.dark,
        description: "Dark", // Description of theme
        data: ThemeData.dark().copyWith(
          pageTransitionsTheme: _settingPageTransitionsTheme,
          primaryColor: const Color(0xff1658E4),
          colorScheme: const ColorScheme.light().copyWith(
            background: Colors.white,
            onBackground: const Color(0xffF5F5F5),
          ),
          dividerColor: const Color(0xffFFFFFF).withOpacity(0.05),
          focusColor: const Color(0xff1658E4),
          textTheme: TextTheme(
            headlineSmall: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: FontConst.beVietnamPro,
            ),
            headlineMedium: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: FontConst.beVietnamPro,
            ),
            headlineLarge: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: FontConst.beVietnamPro,
            ),
            titleSmall: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: FontConst.beVietnamPro,
            ),
            titleMedium: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: FontConst.beVietnamPro,
            ),
            titleLarge: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: FontConst.beVietnamPro,
            ),
            bodySmall: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontFamily: FontConst.beVietnamPro,
            ),
            bodyMedium: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
              fontFamily: FontConst.beVietnamPro,
            ),
            bodyLarge: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 18,
              fontFamily: FontConst.beVietnamPro,
            ),
          ),
        ),
      ),
    ];
  }

  static PageTransitionsTheme get _settingPageTransitionsTheme {
    return PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (dynamic _) => const ZoomPageTransitionsBuilder(),
      ),
    );
  }
}
