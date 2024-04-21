import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildButtonFunction(
    {required BuildContext context,
    required VoidCallback onPressed,
    required svgPath,
    required double width,
    required double height,
    required Color textColor,
    double? borRadius,
    Color? backgroundColor,
    required String text}) {
  return GestureDetector(
    onTap: onPressed,
    child: SizedBox(
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(255, 255, 255, 0.05),
                border: const Border.fromBorderSide(BorderSide(
                    width: 1, color: Color.fromRGBO(255, 255, 255, 0.15)))),
            child: SvgPicture.asset(
              svgPath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w400, color: textColor),
          )
        ],
      ),
    ),
  );
}
