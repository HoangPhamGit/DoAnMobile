import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class LienKetNganHang extends StatefulWidget {
  final String? tenNganHang;
  final String? imagePath;
  final Color? color;
  const LienKetNganHang(
      {super.key, this.tenNganHang, this.imagePath, this.color});

  @override
  State<LienKetNganHang> createState() => _LienKetNganHangState();
}

class _LienKetNganHangState extends State<LienKetNganHang> {
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
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    widget.imagePath ?? '',
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.tenNganHang ?? '',
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff030E26)),
              )
            ],
          )
        ],
      ),
    );
  }
}
