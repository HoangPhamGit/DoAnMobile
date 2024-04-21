import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theme_provider/theme_provider.dart';

DateTime? _currentBackPressTime;

class ScaffoldBase extends WillPopScope {
  ///
  ///Hoat dong khi Appbar = null
  final String? titleAppBar;

  ScaffoldBase(
    BuildContext context, {
    super.key,
    PreferredSizeWidget? appBar,
    Widget? body,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    List<Widget>? persistentFooterButtons,
    Widget? drawer,
    Function(bool)? onDrawerChanged,
    Widget? endDrawer,
    Function(bool)? onEndDrawerChanged,
    Widget? bottomNavigationBar,
    Widget? bottomSheet,
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool primary = true,
    DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool drawerEnableOpenDragGesture = true,
    bool endDrawerEnableOpenDragGesture = true,
    String? restorationId,
    bool doubleBack2Pop = false,
    this.titleAppBar,
  }) : super(
          onWillPop: () {
            if (EasyLoading.isShow) {
              return Future.value(false);
            }

            if (doubleBack2Pop) {
              DateTime now = DateTime.now();
              if (_currentBackPressTime == null ||
                  now.difference(_currentBackPressTime!) >
                      const Duration(seconds: 2)) {
                _currentBackPressTime = now;
                Fluttertoast.showToast(
                    msg: "base.double-back-button".tr(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return Future.value(false);
              }
              SystemNavigator.pop();
            }

            return Future.value(true);
          },
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Divider(
                  color: ThemeProvider.themeOf(context).data.dividerColor,
                  height: 1,
                ),
                Expanded(
                  child: body!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.bottom,
                )
              ],
            ),
            key: key,
            appBar: titleAppBar != null
                ? _AppBarDefault(
                    context,
                    title: titleAppBar,
                  )
                : appBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButtonAnimator: floatingActionButtonAnimator,
            persistentFooterButtons: persistentFooterButtons,
            drawer: drawer,
            onDrawerChanged: onDrawerChanged,
            endDrawer: endDrawer,
            onEndDrawerChanged: onEndDrawerChanged,
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            primary: primary,
            drawerDragStartBehavior: drawerDragStartBehavior,
            extendBody: extendBody,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            drawerScrimColor: drawerScrimColor,
            drawerEdgeDragWidth: drawerEdgeDragWidth,
            drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
            endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
            restorationId: restorationId,
          ),
        );
}

Widget _buildBackButton(
  BuildContext context, [
  Function? onTap,
  Color? color,
]) {
  return InkWell(
    child: Icon(
      Icons.arrow_back_ios,
      size: 16,
      color: color ??
          ThemeProvider.themeOf(context).data.textTheme.titleSmall!.color,
    ),
    onTap: () {
      if (onTap != null) {
        onTap();
      } else {
        Navigator.of(context).pop();
      }
    },
  );
}

class _AppBarDefault extends AppBar {
  _AppBarDefault(
    BuildContext context, {
    required String title,
  }) : super(
          title: Text(
            title,
            style: TextStyle(
                color: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .color),
          ),
          leading: _buildBackButton(context),
          backgroundColor:
              ThemeProvider.themeOf(context).data.colorScheme.background,
          centerTitle: true,
          titleSpacing: 0,
          elevation: 0,
        );
}
