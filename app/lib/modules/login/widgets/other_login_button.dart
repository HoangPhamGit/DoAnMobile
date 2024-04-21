import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class OtherLoginButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final String prefixIconPath;
  const OtherLoginButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.prefixIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsets>((states) {
          return const EdgeInsets.symmetric(
            vertical: 11,
            horizontal: 16,
          ); // Default padding
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          return Colors.white.withOpacity(0.05); // Default padding
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: const Color(0xffFFFFFF).withOpacity(0.3)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                prefixIconPath,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          const Icon(
            Icons.navigate_next_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
