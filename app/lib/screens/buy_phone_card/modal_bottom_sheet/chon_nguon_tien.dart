import 'package:app/screens/buy_phone_card/widgets/item_ngan_hang.dart';
import 'package:app/screens/buy_phone_card/widgets/litem_lien_ket_ngan_hang.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ChonNguonTien extends StatefulWidget {
  const ChonNguonTien({super.key});

  @override
  State<ChonNguonTien> createState() => _ChonNguonTienState();
}

class _ChonNguonTienState extends State<ChonNguonTien> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Chọn nguồn tiền',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleMedium!
                        .copyWith(color: const Color(0xff030E26)),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 32,
            color: const Color(0xff000000).withOpacity(0.05),
          ),
          const ItemNganHang(
            content: 'Số dư: 12.394.232đ',
            tenNganHang: 'FlexPay',
            imagePath: 'assets/images/ic_flexpay.png',
          ),
          const SizedBox(
            height: 16,
          ),
          const ItemNganHang(
            content: '3823 *** *** 3919',
            tenNganHang: 'Vietcombank',
            imagePath: 'assets/images/ic_viecombank.png',
            color: Color(0xffE1FCD4),
          ),
          const SizedBox(
            height: 16,
          ),
          const LienKetNganHang(
            tenNganHang: 'Thẻ/TK Ngân hàng khác',
            imagePath: 'assets/images/ic_ngan_hang_khac.png',
            color: Color(0xff1658E4),
          ),
          const SizedBox(
            height: 16,
          ),
          const LienKetNganHang(
            tenNganHang: 'Thẻ quốc tế',
            imagePath: 'assets/images/ic_the_quoc_te.png',
            color: Color(0xff1658E4),
          )
        ]),
      ),
    );
  }
}
