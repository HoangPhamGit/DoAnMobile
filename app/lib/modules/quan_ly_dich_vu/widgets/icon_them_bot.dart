import 'package:flutter/material.dart';

Widget buildAddDeleteIcon({
  required BuildContext context,
  required bool isAdd,
}) {
  return GestureDetector(
    onTap: () {
      isAdd = false;
    },
    child: Container(
      width: 15,
      height: 15,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isAdd
              ? const Color.fromRGBO(22, 88, 228, 1)
              : const Color.fromRGBO(236, 58, 57, 1),
          border: const Border.fromBorderSide(
              BorderSide(width: 0.94, color: Colors.white)),
          borderRadius: BorderRadius.circular(3.86)),
      child: Transform(
        transform: Matrix4.translationValues(0, -4, 0),
        child: Text(
          isAdd ? '+' : '-',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
