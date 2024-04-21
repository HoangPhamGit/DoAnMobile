import 'package:app/commons/common_functions.dart';
import 'package:app/components/components.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CashInConfirmScreen extends StatefulWidget {
  const CashInConfirmScreen({super.key});

  @override
  State<CashInConfirmScreen> createState() => _CashInConfirmScreenState();
}

class _CashInConfirmScreenState extends State<CashInConfirmScreen> {
  final LoadingTextButtonController submitController =
      LoadingTextButtonController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "50,000đ",
            textAlign: TextAlign.center,
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .titleLarge
                ?.copyWith(
                    fontSize: 28,
                    color: ThemeProvider.themeOf(context).data.primaryColor),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: ThemeProvider.themeOf(context).data.colorScheme.background,
            child: Column(
              children: [
                const TitleValueHorizontal(title: "Ngân hàng", value: "MB"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonFunctions.buildDivider(context),
                ),
                const TitleValueHorizontal(
                    title: "Tài khoản gửi", value: "MB*5383"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonFunctions.buildDivider(context),
                ),
                const TitleValueHorizontal(
                  title: "Tài khoản nhận",
                  value: "Ví điện tử 03333333",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonFunctions.buildDivider(context),
                ),
                const TitleValueHorizontal(
                    title: "Họ tên", value: "Nguyễn Viết Tiến"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonFunctions.buildDivider(context),
                ),
                const TitleValueHorizontal(title: "Số tiền", value: "50,000"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonFunctions.buildDivider(context),
                ),
                const TitleValueHorizontal(title: "Phí giao dịch", value: "0"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonFunctions.buildDivider(context),
                ),
                TitleValueHorizontal(
                  title: "Tổng tiền",
                  value: "50,000đ",
                  textStyleValue: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall
                      ?.copyWith(
                          color:
                              ThemeProvider.themeOf(context).data.primaryColor),
                ),
                const SizedBox(height: 30),
                LoadingTextButton(
                  controller: submitController,
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(AppRoutesConst.cashInSuccessfulDetail);
                  },
                  title: "Xác nhận",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
