import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class TextChiTietGD extends StatefulWidget {
  final String? title;
  final String? content;
  final Color? colorText;
  final Color? colorImage;
  final bool? showIcon;
  final String? imagePath;
  final bool? showIconNganHang;
  final String? imagePathNganHang;
  const TextChiTietGD(
      {super.key,
      this.title,
      this.content,
      this.showIcon,
      this.imagePath,
      this.colorText,
      this.colorImage,
      this.showIconNganHang,
      this.imagePathNganHang});

  @override
  State<TextChiTietGD> createState() => _TextChiTietGDState();
}

class _TextChiTietGDState extends State<TextChiTietGD> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1,
          height: 32,
          color: const Color(0xff000000).withOpacity(0.05),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                widget.title ?? '',
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff030E26).withOpacity(0.7)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.content ?? '',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: widget.colorText ??
                                    const Color(0xff030E26)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      widget.showIconNganHang ?? false
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child:
                                  Image.asset(widget.imagePathNganHang ?? ''),
                            )
                          : Container()
                    ],
                  ),
                  widget.showIcon ?? false
                      ? (SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            widget.imagePath ?? '',
                            height: 24,
                            color: widget.colorImage,
                          ),
                        ))
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
