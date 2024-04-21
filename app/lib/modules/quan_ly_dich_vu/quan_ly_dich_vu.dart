import 'package:app/modules/quan_ly_dich_vu/quan_ly_dichvu_change_notifier.dart';
import 'package:app/modules/quan_ly_dich_vu/widgets/quan_ly_dich_vu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class QuanLyDichVu extends StatefulWidget {
  const QuanLyDichVu({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => QuanLyDichVuChangeNotifier(),
      child: const QuanLyDichVu(),
    );
  }

  @override
  State<QuanLyDichVu> createState() => _QuanLyDichVuState();
}

class _QuanLyDichVuState extends State<QuanLyDichVu> {
  late QuanLyDichVuChangeNotifier _notifier;
  bool isChange = false;
  List b = [];
  @override
  void initState() {
    _notifier = context.read<QuanLyDichVuChangeNotifier>();
    b.addAll(_notifier.getYeuThic());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
        elevation: 1,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: isChange
                ? Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/cancel_x.svg',
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
        title: Text(
          "Quản lý dịch vụ",
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(
                  color: const Color.fromRGBO(3, 14, 38, 1),
                  fontWeight: FontWeight.w700),
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  isChange = !isChange;
                });
              },
              child: Text(
                isChange ? 'Lưu' : 'Sửa',
                textAlign: TextAlign.center,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall!
                    .copyWith(
                        color: const Color.fromRGBO(22, 88, 228, 1),
                        fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 16, left: 24, right: 24, bottom: 24),
              width: MediaQuery.of(context).size.width,
              height: 262,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dịch vụ yêu thích',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            color: const Color.fromRGBO(3, 14, 38, 1),
                            fontWeight: FontWeight.w700),
                  ),
                  Flexible(
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: b.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  mainAxisExtent: 88),
                          itemBuilder: (_, index) {
                            final data = b[index];
                            return buildQuanLyDichVuItem(
                              context: context,
                              imgPath: data['imgPath'].toString(),
                              text: data['title'].toString(),
                              isAdd: data['isAdd'],
                              isChange: isChange,
                            );
                          })),
                ],
              ),
            ),
            const Divider(
              height: 0,
              thickness: 4,
              color: Color.fromRGBO(3, 14, 38, 0.1),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 16, left: 24, right: 24, bottom: 24),
              width: MediaQuery.of(context).size.width,
              height: 262,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thanh toán',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            color: const Color.fromRGBO(3, 14, 38, 1),
                            fontWeight: FontWeight.w700),
                  ),
                  Flexible(
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _notifier.danhMucItems().length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  mainAxisExtent: 88),
                          itemBuilder: (_, index) {
                            final data = _notifier.danhMucItems()[index];
                            return buildQuanLyDichVuItem(
                              context: context,
                              imgPath: data['imgPath'].toString(),
                              text: data['title'].toString(),
                              isAdd: data['isAdd'],
                              isChange: isChange,
                            );
                          })),
                ],
              ),
            ),
            const Divider(
              height: 0,
              thickness: 4,
              color: Color.fromRGBO(3, 14, 38, 0.1),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 16, left: 24, right: 24, bottom: 24),
              width: MediaQuery.of(context).size.width,
              height: 262,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hóa đơn',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            color: const Color.fromRGBO(3, 14, 38, 1),
                            fontWeight: FontWeight.w700),
                  ),
                  Flexible(
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _notifier.dichVu.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  mainAxisExtent: 88),
                          itemBuilder: (_, index) {
                            final data = _notifier.dichVu[index];
                            return buildQuanLyDichVuItem(
                              context: context,
                              imgPath: data['imgPath'].toString(),
                              text: data['title'].toString(),
                              isAdd: data['isAdd'],
                              isChange: isChange,
                            );
                          })),
                ],
              ),
            ),
            const Divider(
              height: 0,
              thickness: 4,
              color: Color.fromRGBO(3, 14, 38, 0.1),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 16, left: 24, right: 24, bottom: 24),
              width: MediaQuery.of(context).size.width,
              height: 262,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Khác',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            color: const Color.fromRGBO(3, 14, 38, 1),
                            fontWeight: FontWeight.w700),
                  ),
                  Flexible(
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _notifier.dichVu.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  mainAxisExtent: 88),
                          itemBuilder: (_, index) {
                            final data = _notifier.dichVu[index];
                            return buildQuanLyDichVuItem(
                              context: context,
                              imgPath: data['imgPath'].toString(),
                              text: data['title'].toString(),
                              isAdd: data['isAdd'],
                              isChange: isChange,
                            );
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
