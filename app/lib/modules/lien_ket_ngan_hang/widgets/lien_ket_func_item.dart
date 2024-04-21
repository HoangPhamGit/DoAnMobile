import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class LienKetFuncItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color textColor;
  final Function()? onPressed;
  final Widget? suffixWidget;
  const LienKetFuncItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.suffixWidget,
    this.onPressed,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                iconPath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 9),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(
                      color: textColor,
                    ),
              ),
            ),
            const Spacer(),
            (suffixWidget != null)
                ? suffixWidget!
                : const Icon(Icons.navigate_next_outlined,
                    size: 24, color: Color.fromRGBO(3, 14, 38, 0.4)),
          ],
        ),
      ),
    );
  }
}
