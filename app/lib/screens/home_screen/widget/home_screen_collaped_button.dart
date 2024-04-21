import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class BuildCollapsedButton extends StatelessWidget {
  const BuildCollapsedButton(
      {super.key, required this.svgPath, required this.text});
  final String svgPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6, right: 12),
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(255, 255, 255, 0.05),
          border: const Border.fromBorderSide(BorderSide(
              width: 1, color: Color.fromRGBO(255, 255, 255, 0.15)))),
      child: Row(
        children: [
          SvgPicture.asset(
            svgPath,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(text,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodySmall!
                  .copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(255, 255, 255, 0.7),
                  ))
        ],
      ),
    );
  }
}
