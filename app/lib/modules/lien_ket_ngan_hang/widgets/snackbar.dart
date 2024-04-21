import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_provider/theme_provider.dart';

SnackBar buildSuccessSnackBar(BuildContext context, String message) {
  return SnackBar(
    content: SizedBox(
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(0, 0, 0, 0.3)),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              message,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          )
        ],
      ),
    ),
    backgroundColor: const Color(0xff0ABD59),
  );
}

SnackBar buildErrorSnackBar(BuildContext context, String message) {
  return SnackBar(
    content: SizedBox(
      child: Row(
        children: [
          Container(
              width: 28,
              height: 28,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(0, 0, 0, 0.3)),
              child: SvgPicture.asset(
                'assets/images/svg/cancel_x.svg',
                fit: BoxFit.fitWidth,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              message,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          )
        ],
      ),
    ),
    backgroundColor: const Color.fromRGBO(237, 27, 37, 1),
  );
}
