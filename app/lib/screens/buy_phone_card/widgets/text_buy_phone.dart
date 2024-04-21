import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class TextBuyPhone extends StatefulWidget {
  final String titleName;
  final String content;
  final Color? colorText;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextBuyPhone(
      {super.key,
      required this.titleName,
      required this.content,
      this.colorText,
      this.fontSize,
      this.fontWeight});

  @override
  State<TextBuyPhone> createState() => _TextBuyPhoneState();
}

class _TextBuyPhoneState extends State<TextBuyPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.titleName,
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff030E26)),
          ),
          Text(
            widget.content,
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight ?? FontWeight.w500,
                    color: widget.colorText ?? const Color(0xff030E26)),
          ),
        ],
      ),
    );
  }
}
