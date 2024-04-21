import 'package:app/screens/home_screen/widget/dich_vu_part.dart';
import 'package:app/screens/home_screen/widget/uu_dai_khac_part.dart';

import 'package:flutter/material.dart';

import '../widget/hoa_don_part.dart';
import '../widget/khuyen_mai_part.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(
    initialPage: 3,
  );

  int index = 0;
  _updateIndi(index) {
    setState(() {
      index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 4,
          width: 40,
          color: const Color.fromRGBO(216, 218, 229, 1),
        ),
        const SizedBox(
          height: 24,
        ),
        const HomeScreenHoaDon(),
        const Divider(
          thickness: 1,
          height: 24,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        ),
        const HomeScreenDichVu(),
        const Divider(
          thickness: 1,
          height: 24,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        ),
        const HomeScreenKhuyenMai(),
        const Divider(
          thickness: 1,
          height: 24,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        ),
        const HomeScreenUuDaiKhac(),
      ],
    );
  }
}
