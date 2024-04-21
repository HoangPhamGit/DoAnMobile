import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CommonFunctions {
  static Widget buildDivider(BuildContext context) {
    return Divider(
      color: ThemeProvider.themeOf(context).data.dividerColor,
      height: 1,
      thickness: 1,
    );
  }
}
