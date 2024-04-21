import 'package:flutter/material.dart';

import '../modules/data/global.dart';

class ListNhaMang extends StatefulWidget {
  const ListNhaMang({super.key});

  @override
  State<ListNhaMang> createState() => _ListNhaMangState();
}

class _ListNhaMangState extends State<ListNhaMang> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: nhaMang.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisExtent: 40,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: selectedIndex == index
                            ? const Color(0xff1658E4)
                            : const Color(0xffE6E6E6),
                        width: 1)),
                child: SizedBox(
                  width: 39,
                  height: 24,
                  child: Image.asset(nhaMang[index]),
                )),
          );
        },
      ),
    );
  }
}
