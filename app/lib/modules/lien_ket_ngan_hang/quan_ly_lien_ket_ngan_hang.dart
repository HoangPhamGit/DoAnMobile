import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/lien_ket_ngan_hang/widgets/lien_ket_hien_tai_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class QuanLyLienKet extends StatefulWidget {
  const QuanLyLienKet({super.key});
  static Widget create() {
    return const QuanLyLienKet();
  }

  @override
  State<QuanLyLienKet> createState() => _QuanLyLienKetState();
}

class _QuanLyLienKetState extends State<QuanLyLienKet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeProvider.themeOf(context).data.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: ThemeProvider.themeOf(context).data.primaryColor,
        title: Text(
          'link-card.title.ql-lienket'.tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'link-card.title.hien-tai'.tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodySmall!
                  .copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(22, 88, 228, 1)),
            ),
            const SizedBox(
              height: 24,
            ),
            buildLienKetItem(
                context: context,
                imgPath: 'assets/images/ic_teckcombank.png',
                tenNganHang: 'Techcombank',
                soTk: '98595959595959'),
            const SizedBox(
              height: 24,
            ),
            buildLienKetItem(
                context: context,
                imgPath: 'assets/images/ic_vibbank.png',
                tenNganHang: 'VIB bank',
                soTk: '98595959595959'),
            const SizedBox(
              height: 24,
            ),
            buildLienKetItem(
                context: context,
                imgPath: 'assets/images/ic_bidvbank.png',
                tenNganHang: 'BIDV',
                soTk: '98595959595959'),
            const Divider(
              height: 48,
              thickness: 1,
              color: Color.fromRGBO(3, 14, 38, 0.05),
            ),
            Text(
              'link-card.title.them-moi'.tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodySmall!
                  .copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(22, 88, 228, 1)),
            ),
            const SizedBox(
              height: 24,
            ),
            buildThemLKMoi(
              context: context,
              imgPath: 'assets/images/the_ngan_hang_lien_ket.png',
              name: 'link-card.button.the-nh'.tr(),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesConst.lienKetThe);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            buildThemLKMoi(
                context: context,
                imgPath: 'assets/images/the_tin_dung_lien_ket.png',
                name: 'link-card.button.the-td'.tr(),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutesConst.lienKetThe);
                }),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(BorderSide(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.05))),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'link-card.content.ho-tro'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(3, 14, 38, 0.4)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildThemLKMoi({
  required BuildContext context,
  required String name,
  required String imgPath,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          child: Image.asset(imgPath),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          name,
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        )
      ],
    ),
  );
}
