import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class ButtonFogotPassword extends StatefulWidget {
  final VoidCallback onpressed;
  final String buttonText;
  final double? borderWidth;
  final double? radius;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final bool? showIcon;

  const ButtonFogotPassword(
      {super.key,
      required this.onpressed,
      required this.buttonText,
      this.borderWidth,
      this.radius,
      this.borderColor,
      this.buttonColor,
      this.textColor,
      this.fontWeight,
      this.showIcon = false});

  @override
  State<ButtonFogotPassword> createState() => _ButtonFogotPasswordState();
}

class _ButtonFogotPasswordState extends State<ButtonFogotPassword> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 48,
      child: ElevatedButton(
        onPressed: widget.onpressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: widget.borderWidth ?? 0,
                    color: widget.borderColor ?? Colors.white),
                borderRadius: BorderRadius.circular(widget.radius ?? 8)),
            backgroundColor:
                widget.buttonColor ?? const Color.fromRGBO(22, 88, 228, 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.showIcon ?? false)
              Row(
                children: [
                  SizedBox(
                    width: 19.5,
                    height: 19.5,
                    child: ClipRRect(
                      child: SvgPicture.asset(
                        'assets/images/svg/union.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            Text(
              widget.buttonText,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium!
                  .copyWith(
                      color: widget.textColor ?? Colors.white,
                      fontWeight: widget.fontWeight ?? FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
