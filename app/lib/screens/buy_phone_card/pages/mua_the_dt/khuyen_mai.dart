import 'package:app/screens/buy_phone_card/modules/buy_card_changenotifier.dart';
import 'package:app/screens/buy_phone_card/widgets/app_bar.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class KhuyenMai extends StatefulWidget {
  const KhuyenMai({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (contex) => BuyPhoneCardChangenotifier(),
      child: const KhuyenMai(),
    );
  }

  @override
  State<KhuyenMai> createState() => _KhuyenMaiState();
}

class _KhuyenMaiState extends State<KhuyenMai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1658E4),
      appBar: AppBarTopUp(
        elevation: 0,
        backgroundColor: const Color(0xff1658E4),
        title: 'Mã khuyến mại của bạn',
        textStyle: ThemeProvider.themeOf(context)
            .data
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.white),
      ),
      body: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: Colors.white),
        child: Column(
          children: [
            const FssTextField(
              hintText: 'Nhập tìm kiếm',
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: Color(0xff030E26),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/images/ic_km.png',
                            fit: BoxFit.cover,
                            width: 56,
                            height: 56,
                          ),
                        ),
                        SizedBox(
                          width: 223,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Giảm 5.000₫ khi nạp tiền điện thoại trực tiếp hoặc mua thẻ điện thoại.',
                                  style: ThemeProvider.themeOf(context)
                                      .data
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: const Color(0xff030E26))),
                              Text(
                                'Hạn cuối: 16 tháng 2, 2024 - 23:59',
                                style: ThemeProvider.themeOf(context)
                                    .data
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 12,
                                        color: const Color(0xff030E26)
                                            .withOpacity(0.4)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.5),
                              color: Color(0xff1658E4)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
