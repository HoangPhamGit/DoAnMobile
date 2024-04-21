import 'package:app/components/components.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/dich_vu/notifier/dich_vu_notifier.dart';
import 'package:app/modules/dich_vu/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;

class DichVu extends StatefulWidget {
  const DichVu({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => DichVuChangeNotifier(),
      child: const DichVu(),
    );
  }

  @override
  State<DichVu> createState() => _DichVuState();
}

class _DichVuState extends State<DichVu> {
  DichVuChangeNotifier notifier = DichVuChangeNotifier();
  LoadingTextButtonController buttonController = LoadingTextButtonController();
  @override
  void initState() {
    notifier = Provider.of<DichVuChangeNotifier>(context, listen: false);
    super.initState();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff000000).withOpacity(0.3)),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                message!,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xff0ABD59),
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Selector<DichVuChangeNotifier, bool>(
      selector: (p0, p1) => p1.isLuu,
      shouldRebuild: (previous, next) => true,
      builder: (context, value, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0.1,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Quản lý dịch vụ',
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium!
                  .copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff030E26),
                  ),
            ),
            leading: notifier.isLuu
                ? InkWell(
                    onTap: () {
                      showAnimatedDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return ShowDiaLog(
                              left: () {
                                notifier.changeLuaSua();
                                Navigator.pop(context);
                              },
                              right: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                          animationType: DialogTransitionType.scale,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(seconds: 1));
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      if (globals.navigatorContext != null) {
                        Navigator.of(globals.navigatorContext!)
                            .pushNamed(AppRoutesConst.mainMenu);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
            actions: [
              notifier.isLuu
                  ? InkWell(
                      onTap: () {
                        snackBar('Thay đổi dịch vụ yêu thích thành công');

                        notifier.changeLuaSua();
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(
                            'Lưu',
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff1658E4)),
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        notifier.changeLuaSua();
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(
                            'Sửa',
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff1658E4)),
                          ),
                        ),
                      ),
                    )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 262,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dịch vụ yêu thích',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff030E26)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Selector<DichVuChangeNotifier,
                          List<Map<String, dynamic>>>(
                        selector: (p0, p1) => p1.dichVuYeuThich,
                        shouldRebuild: (previous, next) => true,
                        builder: (context, dichVuYeuThich, child) {
                          return SizedBox(
                            height: 192,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: dichVuYeuThich.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisExtent: 88,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4),
                              itemBuilder: (context, index) {
                                final item = dichVuYeuThich[index];
                                return InkWell(
                                  onTap: () {
                                    // notifier.removeItemYeuThich(item);
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                              width: 48,
                                              height: 48,
                                              child: Image.asset(
                                                  item['imagePath'])),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            item['tenDichVu'],
                                            textAlign: TextAlign.center,
                                            style:
                                                ThemeProvider.themeOf(context)
                                                    .data
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff282835)),
                                          )
                                        ],
                                      ),
                                      if (notifier.isLuu == true)
                                        Positioned(
                                          top: 0,
                                          right: 8,
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0xffEC1D25),
                                            ),
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                //Yeu_thich
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 262,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thanh toán',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff030E26)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Selector<DichVuChangeNotifier,
                          List<Map<String, dynamic>>>(
                        selector: (p0, p1) => p1.thanhToan,
                        shouldRebuild: (previous, next) => true,
                        builder: (context, dichVuYeuThich, child) {
                          return SizedBox(
                            height: 192,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: dichVuYeuThich.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisExtent: 88,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4),
                              itemBuilder: (context, index) {
                                final item = dichVuYeuThich[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                              width: 48,
                                              height: 48,
                                              child: Image.asset(
                                                  item['imagePath'])),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            item['tenDichVu'],
                                            textAlign: TextAlign.center,
                                            style:
                                                ThemeProvider.themeOf(context)
                                                    .data
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff282835)),
                                          )
                                        ],
                                      ),
                                      if (notifier.isLuu)
                                        Positioned(
                                          top: 0,
                                          right: 8,
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0xff1658E4),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                //Thanh toán
                Container(
                  height: 262,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hóa đơn',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff030E26)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Selector<DichVuChangeNotifier,
                          List<Map<String, dynamic>>>(
                        selector: (p0, p1) => p1.thanhToan,
                        shouldRebuild: (previous, next) => true,
                        builder: (context, dichVuYeuThich, child) {
                          return SizedBox(
                            height: 192,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: dichVuYeuThich.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisExtent: 88,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4),
                              itemBuilder: (context, index) {
                                final item = dichVuYeuThich[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                              width: 48,
                                              height: 48,
                                              child: Image.asset(
                                                  item['imagePath'])),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            item['tenDichVu'],
                                            textAlign: TextAlign.center,
                                            style:
                                                ThemeProvider.themeOf(context)
                                                    .data
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff282835)),
                                          )
                                        ],
                                      ),
                                      if (notifier.isLuu)
                                        Positioned(
                                          top: 0,
                                          right: 8,
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0xff1658E4),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                //Hóa đơn
                Container(
                  height: 262,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Khác',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff030E26)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Selector<DichVuChangeNotifier,
                          List<Map<String, dynamic>>>(
                        selector: (p0, p1) => p1.thanhToan,
                        shouldRebuild: (previous, next) => true,
                        builder: (context, dichVuYeuThich, child) {
                          return SizedBox(
                            height: 192,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: dichVuYeuThich.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisExtent: 88,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4),
                              itemBuilder: (context, index) {
                                final item = dichVuYeuThich[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                              width: 48,
                                              height: 48,
                                              child: Image.asset(
                                                  item['imagePath'])),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            item['tenDichVu'],
                                            textAlign: TextAlign.center,
                                            style:
                                                ThemeProvider.themeOf(context)
                                                    .data
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff282835)),
                                          )
                                        ],
                                      ),
                                      if (notifier.isLuu)
                                        Positioned(
                                          top: 0,
                                          right: 8,
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0xff1658E4),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                //Khác
              ],
            ),
          ),
        );
      },
    );
  }
}
