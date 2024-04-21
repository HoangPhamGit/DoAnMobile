import 'package:app/modules/register/notifiers/phone_number_registration_change_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import '../build_bottom_sheet.dart';
import 'term_and_condition.dart';

class BuildTermServiceCheckbox extends StatefulWidget {
  const BuildTermServiceCheckbox({super.key});

  @override
  State<BuildTermServiceCheckbox> createState() =>
      _BuildTermServiceCheckboxState();
}

class _BuildTermServiceCheckboxState extends State<BuildTermServiceCheckbox> {
  bool checkValue = false;
  bool isClickTerm = false;
  late PhoneNumberRegistrationChangeNotifier _notifier;
  @override
  void initState() {
    _notifier = context.read<PhoneNumberRegistrationChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Consumer<PhoneNumberRegistrationChangeNotifier>(
              builder: (context, provider, child) {
                return Checkbox(
                  activeColor: Colors.blue,
                  hoverColor: const Color.fromRGBO(3, 14, 38, 0.4),
                  value: _notifier.isAgreeTerm,
                  onChanged: (value) {
                    _notifier.checkTerm(value);
                  },
                );
              },
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: '${"register.term-service-1".tr()} ',
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(
                      color: const Color.fromRGBO(3, 14, 38, 0.7),
                      fontWeight: FontWeight.w400,
                    ),
                children: [
                  TextSpan(
                    text: '${"register.term-service-2".tr()}\n',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodySmall!
                        .copyWith(
                          color: const Color.fromRGBO(22, 88, 228, 1),
                          fontWeight: FontWeight.w400,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          checkValue = true;
                          isClickTerm = true;
                          //_check();
                        });
                        // size < 1
                        buildBottomSheet(
                            context: context,
                            bottomSheet: buildTermConBotSheet(context),
                            size: 0.9);
                        // showModalBottomSheet(
                        //     context: context,
                        //     isScrollControlled: true,
                        //     useSafeArea: true,
                        //     shape: const RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.vertical(
                        //             top: Radius.circular(24))),
                        //     builder: (BuildContext context) {
                        //       return FractionallySizedBox(
                        //         heightFactor: 0.9,
                        //         child: buildTermConBotSheet(context),
                        //       );
                        //     });

                        ///Mo tai khoan
                      },
                  ),
                  TextSpan(
                    text: "${"register.term-service-3".tr()} ",
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodySmall!
                        .copyWith(
                          color: const Color.fromRGBO(3, 14, 38, 0.7),
                          fontWeight: FontWeight.w400,
                        ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
