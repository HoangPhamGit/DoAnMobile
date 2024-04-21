import 'package:app/configs/routes/app_routes_const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import '../onboarding_change_notifier.dart';

class ButtonAction extends StatefulWidget {
  const ButtonAction({super.key});

  @override
  State<ButtonAction> createState() => _ButtonActionState();
}

class _ButtonActionState extends State<ButtonAction> {
  late OnboardingChangeNotifier _notifier;
  @override
  void initState() {
    _notifier = context.read<OnboardingChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<OnboardingChangeNotifier, int>(
      selector: (p0, p1) => p1.index,
      builder: (context, index, child) {
        String text = _notifier.tabController.length - 1 == index
            ? "base.start".tr()
            : "base.continue".tr();
        return Stack(
          children: [
            AnimatedOpacity(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              opacity: index > 0 ? 1 : 0,
              child: TextButton(
                onPressed: () {
                  _notifier.onPreviousPage();
                },
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsets>((states) {
                    return const EdgeInsets.all(4); // Default padding
                  }),
                ),
                child: Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 250),
              left: index > 0 ? 64 : 0,
              child: TextButton(
                onPressed: () {
                  _notifier.onNextPage(onStart: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutesConst.login,
                      (route) => false,
                    );
                  });
                },
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsets>((states) {
                    return const EdgeInsets.all(4); // Default padding
                  }),
                ),
                child: Container(
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          text,
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                              ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(
                          right: 4,
                          top: 4,
                          bottom: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              ThemeProvider.themeOf(context).data.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
