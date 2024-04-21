import 'package:app/configs/configs.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/theme/theme.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:camera/camera.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:theme_provider/theme_provider.dart';
import 'globals.dart' as globals;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  globals.cameras = await availableCameras();

  ///
  Configs.init(Environment.test);

  Core.init();
  Data.init(
    baseUrl: locator<AppConfig>().baseUrl ?? '?',
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('vi', 'VI'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('vi', 'VI'),
      assetLoader: YamlAssetLoader(),
      child: ThemeProvider(
        saveThemesOnChange: true,
        loadThemeOnInit: true,
        themes: AppThemeManager.themes,
        defaultThemeId: AppThemeId.light,
        child: ThemeConsumer(
          child: Builder(
            builder: (context) {
              locator<ApiClient>().updateLanguage(context.locale.languageCode);
              return MaterialApp(
                navigatorKey: globals.navigatorKey,
                theme: ThemeProvider.themeOf(context).data,
                title: 'FPMobile',
                //home: const App(),
                initialRoute: AppRoutesConst.splashScreen,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                onGenerateRoute: (settings) =>
                    AppRoutes.onGenerateRoutes(context, settings),
              );
            },
          ),
        ),
      ),
    ),
  );
}
