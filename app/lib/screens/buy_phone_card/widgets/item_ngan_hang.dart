import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ItemNganHang extends StatefulWidget {
  final String? tenNganHang;
  final String? content;
  final String? imagePath;
  final Color? color;
  const ItemNganHang(
      {super.key, this.tenNganHang, this.content, this.imagePath, this.color});

  @override
  State<ItemNganHang> createState() => _ItemNganHangState();
}

class _ItemNganHangState extends State<ItemNganHang> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  widget.imagePath ?? '',
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.tenNganHang ?? '',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff030E26)),
                  ),
                  Text(
                    widget.content ?? '',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodySmall!
                        .copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff030E26).withOpacity(0.4)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
