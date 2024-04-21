import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class TitleModalBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final double? maxHeight;
  const TitleModalBottomSheet(
      {Key? key, required this.title, required this.child, this.maxHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var mediaQuery = MediaQuery.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom + 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeProvider.themeOf(context).data.colorScheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      margin: const EdgeInsets.only(top: 30),
      //child: _buildTitle(context),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(context),
            Container(
                constraints: BoxConstraints(
                    maxHeight: maxHeight == null
                        ? (screenHeight * 0.8)
                        : (maxHeight ?? 600)),
                child: child),
            //SizedBox(height: mediaQuery.viewInsets.bottom),
          ],
        ),
      ),
    );
  }

  _buildTitle(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Container(
        //     margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        //     width: 35,
        //     // alignment: Alignment.center,
        //     height: 35,
        //     // decoration: BoxDecoration(
        //     //   color: FAdaptheme.of(context).styleExtend.color.button3,
        //     //   shape: BoxShape.circle,
        //     // ),
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).pop();
        //       },
        //       child: Container(
        //         padding: const EdgeInsets.all(3),
        //         decoration: BoxDecoration(
        //           color: ThemeProvider.themeOf(context).data.dividerColor,
        //           shape: BoxShape.circle,
        //         ),
        //         child: Icon(
        //           Icons.expand_more_outlined,
        //           color: ThemeProvider.themeOf(context)
        //               .data
        //               .textTheme
        //               .titleLarge
        //               ?.color,
        //           size: 24,
        //         ),
        //       ),
        //     ),
        //   ),
        // )

        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color(0xffD8DAE5)),
              height: 4,
              width: 40,
            ),
          ),
        ),
      ],
    );
  }
}
