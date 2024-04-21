import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BaseDialog extends StatelessWidget {
  final Widget child;

  const BaseDialog({
    super.key,
    required this.child,
  });

  static closePopup(BuildContext context) {
    Navigator.of(context).pop();
  }

  static buildActionButton(
      {required String text,
      BoxDecoration? decoration,
      VoidCallback? onPressed,
      Color? color}) {
    return Container(
      height: 48,
      decoration: decoration,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color ?? Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ThemeProvider.themeOf(context).data.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ThemeProvider.themeOf(context).data.colorScheme.onBackground,
          ),
          child: child,
        ),
      ),
    );
  }
}
