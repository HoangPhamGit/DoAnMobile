import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:theme_provider/theme_provider.dart';

class ServiceShimmer extends StatelessWidget {
  const ServiceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 16),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (_, index) {
          return Shimmer.fromColors(
            baseColor: ThemeProvider.themeOf(context)
                .data
                .colorScheme
                .onBackground
                .withOpacity(0.7),
            highlightColor: ThemeProvider.themeOf(context)
                .data
                .colorScheme
                .onBackground
                .withOpacity(0.2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ThemeProvider.themeOf(context)
                    .data
                    .colorScheme
                    .onBackground,
              ),
            ),
          );
        },
      ),
    );
  }
}
