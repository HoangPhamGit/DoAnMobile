import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildVndUnderline(
    {required BuildContext context, required String text}) {
  return Text.rich(TextSpan(
      text: text,
      style: ThemeProvider.themeOf(context)
          .data
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
      children: [
        TextSpan(
          text: 'đ',
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        )
      ]));
}
