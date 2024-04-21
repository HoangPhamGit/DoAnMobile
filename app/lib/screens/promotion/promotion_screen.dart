import 'package:app/widgets/fss_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_snap/sliver_snap.dart';
import 'package:theme_provider/theme_provider.dart';

import 'promotion_change_notifier.dart';
import 'widgets/filter_item.dart';
import 'widgets/promotion_item.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => PromotionChangeNotifier(),
      child: const PromotionScreen(),
    );
  }

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  late PromotionChangeNotifier _notifier;

  @override
  void initState() {
    _notifier = context.read<PromotionChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ThemeProvider.themeOf(context).data.primaryColor,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
          ),
          child: Selector<PromotionChangeNotifier, double>(
            selector: (p0, p1) => p1.scrollingOffset,
            builder: (context, scrollingOffset, child) {
              double opacity = 1 -
                  (scrollingOffset /
                      (_notifier.expandedContentHeight -
                          _notifier.collapsedBarHeight));
              return Opacity(
                opacity: opacity < 0
                    ? 0
                    : opacity > 1
                        ? 1
                        : opacity,
                child: Image.asset("assets/images/ads_1.png",
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                    colorBlendMode: BlendMode.overlay),
              );
            },
          ),
        ),
        SliverSnap(
          onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {
            _notifier.onCollapseStateChanged(scrollingOffset, isCollapsed);
          },
          collapsedBackgroundColor:
              ThemeProvider.themeOf(context).data.primaryColor,
          expandedBackgroundColor: Colors.transparent,
          expandedContentHeight: _notifier.expandedContentHeight,
          expandedContent: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
            ),
            child: _buildExpandedHeader(context),
          ),
          collapsedBarHeight: 104,
          collapsedContent: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewInsets.top,
            ),
            child: _buildCollapsedHeader(context),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: buildBottomHeader(context),
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              color: ThemeProvider.themeOf(context).data.colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildFilter(context),
                const PromotionItem(),
                const PromotionItem(),
                const PromotionItem(),
                const PromotionItem(),
                const PromotionItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ThemeProvider.themeOf(context).data.primaryColor.withOpacity(0.7),
            ThemeProvider.themeOf(context).data.primaryColor.withOpacity(0.5),
            ThemeProvider.themeOf(context).data.primaryColor.withOpacity(0.1),
            Colors.transparent,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Ưu đãi của tôi",
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF).withOpacity(0.25),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/wallet_1.png",
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "1.293.112đ",
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          const FssSearch(),
        ],
      ),
    );
  }

  Widget _buildCollapsedHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Ưu đãi của tôi",
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF).withOpacity(0.25),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/wallet_1.png",
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "1.293.112đ",
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBottomHeader(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Opacity(
        opacity: context.watch<PromotionChangeNotifier>().opacity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: _buildFilter(
            context,
            isBottomHeader: true,
          ),
        ),
      ),
    );
  }

  Widget _buildFilter(BuildContext context, {bool isBottomHeader = false}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffE6E6E6)),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
            child: Icon(
              Icons.tune_outlined,
              color: isBottomHeader
                  ? Colors.white
                  : ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall!
                      .color!,
              size: 20,
            ),
          ),
          const SizedBox(width: 6),
          FilterItem(
            title: "Phân loại theo",
            titleTextStyle: isBottomHeader
                ? (ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12, color: Colors.white))
                : null,
          ),
          const SizedBox(width: 6),
          FilterItem(
              title: "Khu vực",
              titleTextStyle: isBottomHeader
                  ? (ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 12, color: Colors.white))
                  : null),
          const SizedBox(width: 6),
          FilterItem(
            title: "Cửa hàng",
            titleTextStyle: isBottomHeader
                ? (ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12, color: Colors.white))
                : null,
          ),
        ],
      ),
    );
  }
}
