import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildXacNhanBotShItem({
  required BuildContext context,
  required String text,
  required Color textColor,
  required String title,
}) {
  return SizedBox(
    height: 32,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                  color: const Color.fromRGBO(3, 14, 38, 1),
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text,
            textAlign: TextAlign.end,
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        )
      ],
    ),
  );
}
