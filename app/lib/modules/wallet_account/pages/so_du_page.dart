import 'package:app/modules/wallet_account/notifier/money_model.dart';
import 'package:app/modules/wallet_account/notifier/waller_account_change_notifier.dart';
import 'package:app/modules/wallet_account/widget/money_display_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SoDuPage extends StatefulWidget {
  const SoDuPage({super.key});

  @override
  State<SoDuPage> createState() => _SoDuPageState();
}

class _SoDuPageState extends State<SoDuPage> {
  late WalletAccountChangeNotifier _notifier;
  @override
  void initState() {
    _notifier = context.read<WalletAccountChangeNotifier>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 88, 228, 1),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/account_image.png'),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Tran Viet Chinh',
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'FlexPay: 12312312312321',
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                )
              ],
            ),
          ),
          Text(
            "Tổng số dư",
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.7),
                ),
          ),
          Text.rich(TextSpan(
              text: '12.500.000',
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleLarge!
                  .copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              children: [
                TextSpan(
                  text: 'đ',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleLarge!
                      .copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                )
              ])),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SfCircularChart(
                  legend: Legend(
                      isVisible: true,
                      textStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                      overflowMode: LegendItemOverflowMode.wrap,
                      position: LegendPosition.bottom),
                  series: <CircularSeries>[
                    DoughnutSeries<AccountMoney, String>(
                      dataSource: _notifier.chartData.sublist(0, 2),
                      xValueMapper: (AccountMoney data, _) => data.moneyType,
                      yValueMapper: (AccountMoney data, _) => data.amountMoney,
                    )
                  ],
                ),
                Positioned(
                  top: 85,
                  child: Container(
                    width: 135,
                    height: 135,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(22, 88, 228, 1),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      "assets/images/svg/logo.svg",
                      width: 24,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const MoneyDisplayRow(
            titleLeft: 'Số dư khả dụng',
            titleRight: 'Số dư phong tỏa',
            moneyLeft: '6.938.223',
            moneyRight: '12.938.223',
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
