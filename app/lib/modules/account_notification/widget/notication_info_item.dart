import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_provider/theme_provider.dart';

class BuildNotificationInfo extends StatefulWidget {
  const BuildNotificationInfo(
      {super.key,
      required this.title,
      required this.content,
      required this.time,
      required this.isMoney});
  final String title;
  final String content;
  final String time;
  final bool isMoney;

  @override
  State<BuildNotificationInfo> createState() => _BuildNotificationInfoState();
}

class _BuildNotificationInfoState extends State<BuildNotificationInfo> {
  bool isRead = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isRead
              ? const Color.fromRGBO(250, 250, 250, 1)
              : const Color.fromRGBO(22, 88, 228, 0.05),
          border: Border.fromBorderSide(BorderSide(
              color: isRead
                  ? const Color.fromRGBO(230, 230, 230, 1)
                  : const Color.fromRGBO(22, 88, 228, 0.15),
              width: 1)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(203, 219, 255, 1), spreadRadius: 3)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(22, 88, 228, 1),
                borderRadius: BorderRadius.circular(8)),
            child: SvgPicture.asset(
              'assets/images/svg/logo.svg',
              width: 9.6,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            height: 92,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          color: const Color.fromRGBO(3, 14, 38, 1),
                          fontWeight: FontWeight.w500),
                ),
                Text.rich(TextSpan(
                    text: widget.content,
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodySmall!
                        .copyWith(
                            color: const Color.fromRGBO(3, 14, 38, 0.7),
                            fontWeight: FontWeight.w400),
                    children: [
                      widget.isMoney
                          ? TextSpan(
                              text: 'đ',
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      decoration: TextDecoration.underline,
                                      color:
                                          const Color.fromRGBO(3, 14, 38, 0.7),
                                      fontWeight: FontWeight.w500),
                            )
                          : const TextSpan(),
                      widget.isMoney
                          ? TextSpan(
                              text: ' vào ví FlexPay từ VietCombank',
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color:
                                          const Color.fromRGBO(3, 14, 38, 0.7),
                                      fontWeight: FontWeight.w400),
                            )
                          : const TextSpan()
                    ])),
                Text(
                  'Vào lúc ${widget.time}',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          color: const Color.fromRGBO(3, 14, 38, 0.4),
                          fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                isRead = !isRead;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    color: isRead
                        ? Colors.green
                        : const Color.fromRGBO(22, 88, 228, 1),
                    shape: BoxShape.circle),
              ),
            ),
          )
        ],
      ),
    );
  }
}
