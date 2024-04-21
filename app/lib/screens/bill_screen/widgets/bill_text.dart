import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillText extends StatefulWidget {
  final String titleName;
  final String content;
  const BillText({super.key, required this.titleName, required this.content});

  @override
  State<BillText> createState() => _BillTextState();
}

class _BillTextState extends State<BillText> {
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
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff030E26)),
          ),
        ],
      ),
    );
  }
}
