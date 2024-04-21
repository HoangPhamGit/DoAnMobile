import 'package:app/modules/account_notification/widget/thong_bao_so_du_items.dart';
import 'package:flutter/material.dart';

class ThongBaoSoDuPage extends StatefulWidget {
  const ThongBaoSoDuPage({super.key});

  @override
  State<ThongBaoSoDuPage> createState() => _ThongBaoSoDuPageState();
}

class _ThongBaoSoDuPageState extends State<ThongBaoSoDuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: const [
            ThongBaoSoDuItems(
              notiitemCount: 3,
              notidate: 'Hôm nay',
              notiTitle: 'Nạp tiền thành công',
              notiContent: 'Bạn đã nạp số tiền 438.223',
              isMoney: true,
              notitime: '16:32:24',
            ),
            ThongBaoSoDuItems(
              notiitemCount: 5,
              notidate: 'Ngày 16, tháng 3, 2024',
              notiTitle: 'Nạp tiền thành công',
              notiContent: 'Bạn đã nạp số tiền 5.000.000',
              isMoney: true,
              notitime: '16:32:24',
            ),
          ],
        ),
      ),
    );
  }
}
