import 'package:app/screens/home/notifiers/home_change_notifier.dart';
import 'package:app/screens/home/widgets/bill.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_snap/widgets/sliver_snap.dart';
import 'package:theme_provider/theme_provider.dart';
import 'notifiers/bill_change_notifier.dart';
import 'notifiers/favorite_service_change_notifier.dart';
import 'notifiers/other_offer_change_notifier.dart';
import 'notifiers/promotion_change_notifier.dart';
import 'widgets/favorite_service.dart';
import 'widgets/header/bottom_header.dart';
import 'widgets/header/collapsed_header.dart';
import 'widgets/header/expanded_header.dart';
import 'widgets/news.dart';
import 'widgets/promotion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Widget create() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeChangeNotifier()),
        ChangeNotifierProvider(create: (context) => BillChangeNotifier()),
        ChangeNotifierProvider(
            create: (context) => FavoriteServiceChangeNotifier()),
        ChangeNotifierProvider(create: (context) => OtherOfferChangeNotifier()),
        ChangeNotifierProvider(create: (context) => PromotionChangeNotifier()),
      ],
      child: const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeChangeNotifier _notifier;

  @override
  void initState() {
    _notifier = context.read<HomeChangeNotifier>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavoriteServiceChangeNotifier>().loadAllServices(context);
    });
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
          child: Selector<HomeChangeNotifier, double>(
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
                child: Image.asset(
                  "assets/images/home_header.png",
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  colorBlendMode: BlendMode.overlay,
                ),
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
            child: const ExpandedHeader(),
          ),
          collapsedBarHeight: 104,
          collapsedContent: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewInsets.top,
            ),
            child: const CollapsedHeader(),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: BottomHeader(),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  color: ThemeProvider.themeOf(context)
                      .data
                      .colorScheme
                      .background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Bill(),
                    SizedBox(height: 20),
                    FavoriteService(),
                    SizedBox(height: 30),
                    Promotion(),
                    SizedBox(height: 20),
                    News()
                  ],
                ),
              ),
              Positioned(
                top: 12,
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
          ),
        ),
      ],
    );
  }
}
