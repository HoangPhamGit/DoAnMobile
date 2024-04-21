import 'package:app/screens/onboarding/onboarding_change_notifier.dart';
import 'package:app/screens/onboarding/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:theme_provider/theme_provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => OnboardingChangeNotifier(),
      child: const OnBoardingScreen(),
    );
  }

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late OnboardingChangeNotifier _notifier;

  @override
  void initState() {
    _notifier = context.read<OnboardingChangeNotifier>();
    _notifier.tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 250),
            child: TabBarView(
              controller: _notifier.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Image.asset(
                  "assets/images/onboarding_1.jpg",
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  "assets/images/onboarding_2.jpg",
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  "assets/images/onboarding_3.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: ThemeProvider.themeOf(context).data.primaryColor,
              ),
              padding: EdgeInsets.only(
                top: 24,
                right: 24,
                left: 24,
                bottom: MediaQuery.of(context).viewPadding.bottom + 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Selector<OnboardingChangeNotifier, int>(
                    selector: (p0, p1) => p1.index,
                    builder: (context, index, child) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        child: AnimatedSmoothIndicator(
                          activeIndex: index,
                          count: _notifier.tabController.length,
                          effect: ExpandingDotsEffect(
                            radius: 5,
                            dotWidth: 5,
                            dotHeight: 5,
                            activeDotColor: Colors.white,
                            // expansionFactor: 4,
                            dotColor: Colors.white.withOpacity(0.17),
                          ), // your preferred effect
                          onDotClicked: null,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: TabBarView(
                      controller: _notifier.tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            Text(
                              "onboarding.step-1.title".tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "onboarding.step-1.content".tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "onboarding.step-1.title".tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "onboarding.step-1.content".tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "onboarding.step-1.title".tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "onboarding.step-1.content".tr(),
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const ButtonAction()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _notifier.tabController.dispose();
    super.dispose();
  }
}
