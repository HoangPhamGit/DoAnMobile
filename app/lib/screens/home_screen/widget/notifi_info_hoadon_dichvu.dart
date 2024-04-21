import 'package:flutter/material.dart';

Widget buildNotificationInfo({
  required BuildContext context,
  required String text,
  required double width,
  required double height,
  required bool isMoneyFuc,
  double? radius,
}) {
  return Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 58, 57, 1),
        border: const Border.fromBorderSide(
            BorderSide(width: 0.94, color: Colors.white)),
        borderRadius: BorderRadius.circular(radius ?? 30)),
    child: Text(
      text,
      style: TextStyle(
        fontSize: isMoneyFuc ? 12 : 10,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
