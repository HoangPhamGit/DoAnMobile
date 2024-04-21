import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class PromotionItem extends StatelessWidget {
  final bool isLastIndex;
  const PromotionItem({super.key, this.isLastIndex = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: isLastIndex ? 16 : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 167,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/home_screen_khuyen_mai.png',
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "TH True mart - Vương Thừa Vũ",
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                    color: const Color.fromRGBO(22, 88, 228, 1),
                    fontWeight: FontWeight.w400),
          ),
          Text.rich(
            TextSpan(
                text: 'Giảm ',
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .copyWith(
                        color: const Color.fromRGBO(3, 14, 38, 1),
                        fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: ' 8.283',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            color: const Color.fromRGBO(3, 14, 38, 1),
                            fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: 'đ',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            decoration: TextDecoration.underline,
                            color: const Color.fromRGBO(3, 14, 38, 1),
                            fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: ' cho vai mặt hàng',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            color: const Color.fromRGBO(3, 14, 38, 1),
                            fontWeight: FontWeight.w400),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
