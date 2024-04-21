import 'package:flutter/cupertino.dart';

class PromotionChangeNotifier with ChangeNotifier {
  double get expandedContentHeight => 300;
  double get collapsedBarHeight => 104;

  double _scrollingOffset = 0;
  double get scrollingOffset => _scrollingOffset;
  bool _isCollapsed = false;
  bool get isCollapsed => _isCollapsed;

  void onCollapseStateChanged(double scrollingOffset, bool isCollapsed) {
    _scrollingOffset = scrollingOffset;
    _isCollapsed = isCollapsed;
    notifyListeners();
  }

  double get calScrollingOffset =>
      (_scrollingOffset - (expandedContentHeight - collapsedBarHeight)) / 30;

  double get opacity => calScrollingOffset < 0
      ? 0
      : calScrollingOffset > 1
          ? 1
          : calScrollingOffset;
}
