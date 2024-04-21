import 'package:app/commons/common_functions.dart';
import 'package:app/components/components.dart';
import 'package:app/widgets/scaffold_base.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_provider/theme_provider.dart';

class CashInSuccessfulDetail extends StatelessWidget {
  const CashInSuccessfulDetail({super.key});
  static Widget create() {
    return const CashInSuccessfulDetail();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      context,
      titleAppBar: "Chi tiết giao dịch",
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/images/dich_vu/dich_vu_nap_tien.png",
                        width: 45,
                        height: 45,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonFunctions.buildDivider(context),
                    ),
                    const TitleValueHorizontal(
                        title: "Loại giao dịch",
                        value: "Nạp tiền vào tài khoản"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonFunctions.buildDivider(context),
                    ),
                    const TitleValueHorizontal(
                        title: "Trạng thái", value: "Thành công"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonFunctions.buildDivider(context),
                    ),
                    const TitleValueHorizontal(
                        title: "Mã giao dịch", value: "123456789"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonFunctions.buildDivider(context),
                    ),
                    const TitleValueHorizontal(
                        title: "Thời gian", value: "16/03/2024 - 16:03"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonFunctions.buildDivider(context),
                    ),
                    const TitleValueHorizontal(
                        title: "Tài khoản", value: "***1234"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonFunctions.buildDivider(context),
                    ),
                    const TitleValueHorizontal(title: "Phí", value: "0"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonFunctions.buildDivider(context),
                    ),
                    TitleValueHorizontal(
                      title: "Số tiền",
                      value: "10,000",
                      textStyleValue: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                              color: ThemeProvider.themeOf(context)
                                  .data
                                  .primaryColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonFunctions.buildDivider(context),
                    ),
                  ],
                ),
              ),
            ),
            LoadingTextButton(
              backgroundColor: Colors.transparent,
              controller: LoadingTextButtonController(),
              onPressed: () {},
              title: " Chia sẻ",
              icon: Icon(
                Icons.share_outlined,
                color: ThemeProvider.themeOf(context).data.primaryColor,
              ),
              borderRadius: BorderRadius.circular(8),
              borderColor: ThemeProvider.themeOf(context).data.primaryColor,
              textStyle: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
            ),
            const SizedBox(height: 8),
            LoadingTextButton(
              controller: LoadingTextButtonController(),
              onPressed: () {},
              title: "Giao dịch lại",
            ),
          ],
        ),
      ),
    );
  }
}
