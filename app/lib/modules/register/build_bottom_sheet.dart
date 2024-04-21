import 'package:flutter/material.dart';

Future buildBottomSheet({
  required context,
  required bottomSheet,
  double? size,
}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: size ?? 0.8,
          child: bottomSheet,
        );
      });
}
