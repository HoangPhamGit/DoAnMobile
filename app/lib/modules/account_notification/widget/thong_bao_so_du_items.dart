import 'package:app/modules/account_notification/widget/notication_info_item.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ThongBaoSoDuItems extends StatefulWidget {
  const ThongBaoSoDuItems(
      {super.key,
      required this.notiitemCount,
      required this.notidate,
      required this.notiTitle,
      required this.notiContent,
      required this.notitime,
      required this.isMoney});
  final int notiitemCount;
  final String notidate;
  final String notiTitle;
  final String notiContent;
  final String notitime;
  final bool isMoney;

  @override
  State<ThongBaoSoDuItems> createState() => _ThongBaoSoDuItemsState();
}

class _ThongBaoSoDuItemsState extends State<ThongBaoSoDuItems> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                widget.notidate,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(3, 14, 38, 0.4)),
              ),
              const Spacer(),
              const Text('Đã đọc')
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: widget.notiitemCount,
                itemBuilder: (_, index) {
                  return BuildNotificationInfo(
                      title: widget.notiTitle,
                      content: widget.notiContent,
                      isMoney: widget.isMoney,
                      time: widget.notitime);
                }),
          ),
        ],
      ),
    );
  }
}
