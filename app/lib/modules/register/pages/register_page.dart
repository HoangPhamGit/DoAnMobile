import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.title,
    required this.textBottomTitle,
    this.password,
    this.isFirst,
    required this.textField1,
    this.textField2,
    this.termCondition,
  });
  final String title;
  final String textBottomTitle;
  final bool? password;
  final bool? isFirst;

  final Widget textField1;
  final Widget? textField2;
  final Widget? termCondition;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            )),
        title: Text(
          widget.title,
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(3, 14, 38, 1)),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.textBottomTitle,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(3, 14, 38, 0.7)),
            ),
            const SizedBox(
              height: 16,
            ),
            widget.textField1,
            const SizedBox(
              height: 16,
            ),
            widget.password ?? false ? widget.textField2! : Container(),
            const SizedBox(
              height: 16,
            ),
            widget.isFirst ?? false ? widget.termCondition! : Container(),
            widget.password ?? false
                ? Row(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      SvgPicture.asset('assets/images/svg/warning_error.svg'),
                      Text(
                        '   Nội dung cảnh cáo',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(236, 29, 37, 1)),
                      )
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
