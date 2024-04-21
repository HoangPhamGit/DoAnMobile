import 'package:app/modules/account_notification/widget/thong_bao_so_du_items.dart';
import 'package:flutter/material.dart';

class ThongBaoKhacPage extends StatefulWidget {
  const ThongBaoKhacPage({super.key});

  @override
  State<ThongBaoKhacPage> createState() => _ThongBaoKhacPagePageState();
}

class _ThongBaoKhacPagePageState extends State<ThongBaoKhacPage> {
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
              notiTitle: 'Combo Voucher đi chợ online!',
              notiContent:
                  'Chúc mừng bạn nhận được voucher thành công. xem ngay',
              isMoney: false,
              notitime: '16:32:24',
            ),
            ThongBaoSoDuItems(
              notiitemCount: 5,
              notidate: 'Ngày 16, tháng 3, 2024',
              notiTitle: 'Combo Voucher đi chợ online!',
              notiContent:
                  'Chúc mừng bạn nhận được voucher thành công. xem ngay',
              isMoney: false,
              notitime: '16:32:24',
            ),
          ],
        ),
      ),
    );
  }
}
