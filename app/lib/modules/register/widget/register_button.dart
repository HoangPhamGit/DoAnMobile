import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class RegisterButton extends StatefulWidget {
  final VoidCallback doSomeThing;
  final bool agree;
  final String buttonText;
  final double? borderWidth;
  final double? radius;
  final Color? textColor;
  final Color? borderColor;
  final Color? buttonColor;
  const RegisterButton(
      {super.key,
      this.agree = true,
      required this.doSomeThing,
      required this.buttonText,
      this.borderWidth,
      this.borderColor,
      this.buttonColor,
      this.radius,
      this.textColor});

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 48,
      child: ElevatedButton(
        onPressed: widget.agree ? widget.doSomeThing : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: widget.borderWidth ?? 0,
              color: widget.borderColor ?? Colors.white,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 8),
          ),
          backgroundColor:
              widget.buttonColor ?? const Color.fromRGBO(22, 88, 228, 1),
        ),
        child: Text(
          widget.buttonText,
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(
                color: (widget.textColor) ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
