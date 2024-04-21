import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ShowDiaLog extends StatefulWidget {
  final VoidCallback? left;
  final VoidCallback? right;
  const ShowDiaLog({super.key, this.left, this.right});

  @override
  State<ShowDiaLog> createState() => _ShowDiaLogState();
}

class _ShowDiaLogState extends State<ShowDiaLog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
        width: 310,
        height: 256,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff1658E4).withOpacity(0.1)),
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff1658E4),
                    ),
                    child: SizedBox(
                      width: 18.17,
                      height: 20,
                      child: Image.asset('assets/images/ic_notification.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Bạn có chắc chắn muốn thoát',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleMedium!
                      .copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff030E26),
                          decoration: TextDecoration.none),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Vị trí mới của các dịch vụ bàn vừa chỉnh sửa sẽ không được lưu lại.',
                    textAlign: TextAlign.center,
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff030E26).withOpacity(0.7),
                            decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: widget.left,
                  child: Container(
                    width: 120,
                    height: 48,
                    alignment: Alignment.center,
                    child: Text(
                      'Thoát',
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff030E26).withOpacity(0.4),
                              decoration: TextDecoration.none),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: widget.right,
                  child: Container(
                    width: 120,
                    height: 48,
                    alignment: Alignment.center,
                    child: Text(
                      'Sửa tiếp',
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff1658E4),
                              decoration: TextDecoration.none),
                    ),
                  ),
                )
              ],
            )
            // Container(
            //   width: 310,
            //   height: 48,
            //   child: Row(
            //     children: [
            //       LoadingTextButton(
            //         height: 48,
            //         controller: LoadingTextButtonController(),
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         title: 'Thoát',
            //         backgroundColor: Colors.white,
            //         textStyle: ThemeProvider.themeOf(context)
            //             .data
            //             .textTheme
            //             .titleMedium!
            //             .copyWith(
            //               color: const Color(0xff030E26).withOpacity(0.4),
            //             ),
            //       ),
            //       LoadingTextButton(
            //         height: 48,
            //         controller: LoadingTextButtonController(),
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         title: 'Thoát',
            //         backgroundColor: Colors.white,
            //         textStyle: ThemeProvider.themeOf(context)
            //             .data
            //             .textTheme
            //             .titleMedium!
            //             .copyWith(
            //               color: const Color(0xff030E26).withOpacity(0.4),
            //             ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
