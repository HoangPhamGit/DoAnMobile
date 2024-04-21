import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class ButtonBuyPhoneCard extends StatefulWidget {
  final bool? isShowIcon;
  const ButtonBuyPhoneCard({super.key, this.isShowIcon});

  @override
  State<ButtonBuyPhoneCard> createState() => _ButtonBuyPhoneCardState();
}

class _ButtonBuyPhoneCardState extends State<ButtonBuyPhoneCard> {
  LoadingTextButtonController buttonController = LoadingTextButtonController();

  @override
  void initState() {
    buttonController = LoadingTextButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingTextButton(
      height: 48,
      backgroundColor: Colors.white,
      borderColor: const Color(0xff1658E4),
      borderRadius: BorderRadius.circular(8),
      textStyle: ThemeProvider.themeOf(context)
          .data
          .textTheme
          .titleMedium!
          .copyWith(
              fontWeight: FontWeight.w400, color: const Color(0xff1658E4)),
      controller: buttonController,
      onPressed: () {},
      title: 'top-up-phone.share'.tr(),
      icon: widget.isShowIcon ?? false
          ? SvgPicture.asset('assets/images/svg/ic_share.svg')
          : Container(),
    );
  }
}
