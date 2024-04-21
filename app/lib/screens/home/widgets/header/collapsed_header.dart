
import 'package:app/screens/home/widgets/header/top_header.dart';
import 'package:flutter/material.dart';

class CollapsedHeader extends StatelessWidget {
  const CollapsedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopHeader(isCollapsed: true);
  }
}
