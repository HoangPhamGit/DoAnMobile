import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: (MediaQuery.of(context).size.width / 2) - 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: AssetImage('assets/images/home_screen_uu_dai.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Mua Hàng qua FlexPay khi mua hàng giảm 5%",
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleSmall!
              .copyWith(
                  color: const Color.fromRGBO(3, 14, 38, 1),
                  fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 4),
        Text(
          "16 tháng 2, 2022",
          style:
              ThemeProvider.themeOf(context).data.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: const Color.fromRGBO(3, 14, 38, 0.4),
                    fontWeight: FontWeight.w400,
                  ),
        ),
      ],
    );
  }
}
