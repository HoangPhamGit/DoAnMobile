import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:theme_provider/theme_provider.dart';
import '../notifiers/bill_change_notifier.dart';
import 'items/bill_item.dart';

class Bill extends StatefulWidget {
  const Bill({super.key});

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Selector<BillChangeNotifier, bool>(
      selector: (p0, p1) => p1.showAll,
      builder: (context, showAll, child) {
        return Column(
          children: [
            _buildBillHeader(context),
            if (!showAll)
              Container(
                constraints: const BoxConstraints(maxHeight: 70),
                width: double.infinity,
                child: CarouselSlider(
                  items: const [
                    BillItem(),
                    BillItem(),
                    BillItem(),
                  ],
                  carouselController: _controller,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    autoPlayInterval: const Duration(seconds: 10),
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),
            if (!showAll)
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: ThemeProvider.themeOf(context)
                      .data
                      .colorScheme
                      .background,
                  boxShadow: [
                    BoxShadow(
                      color: ThemeProvider.themeOf(context)
                          .data
                          .colorScheme
                          .background,
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 2.0, left: 16, right: 16),
                child: AnimatedSmoothIndicator(
                  activeIndex: _current,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    // radius: 8,
                    spacing: 4.0,
                    radius: 6,
                    dotWidth: 6,
                    dotHeight: 6,
                    activeDotColor: ThemeProvider.themeOf(context)
                        .data
                        .primaryColor
                        .withOpacity(0.5),
                    // expansionFactor: 3,
                    dotColor: ThemeProvider.themeOf(context)
                        .data
                        .primaryColor
                        .withOpacity(0.2),
                  ),
                  onDotClicked: null,
                ),
              ),
            if (showAll)
              Column(
                children: const [
                  BillItem(),
                  SizedBox(height: 8),
                  BillItem(),
                  SizedBox(height: 8),
                  BillItem(),
                ],
              )
          ],
        );
      },
    );
  }

  Widget _buildBillHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("Hoá đơn",
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleMedium),
              const SizedBox(width: 4),
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xffF93E3E),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                    child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )),
              ),
            ],
          ),
          SizedBox(
            width: 24,
            child: IconButton(
              onPressed: () {
                context.read<BillChangeNotifier>().onShowAll();
              },
              icon: Selector<BillChangeNotifier, bool>(
                selector: (p0, p1) => p1.showAll,
                builder: (context, showAll, child) {
                  return Icon(
                    !showAll
                        ? Icons.expand_more_outlined
                        : Icons.expand_less_outlined,
                    color: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodyMedium
                        ?.color,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
