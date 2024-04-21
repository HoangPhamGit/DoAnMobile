import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class TitleValueHorizontal extends StatelessWidget {
  final String title;
  final String? value;
  final TextStyle? textStyleValue;
  const TitleValueHorizontal(
      {super.key, required this.title, this.value, this.textStyleValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: ThemeProvider.themeOf(context).data.textTheme.bodySmall,
        ),
        Text(
          value ?? '',
          style: textStyleValue ??
              ThemeProvider.themeOf(context).data.textTheme.titleSmall,
        )
      ],
    );
  }
}
