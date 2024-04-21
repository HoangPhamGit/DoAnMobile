import 'package:flutter/material.dart';

import '../../screens/main_menu/main_menu_screen.dart';

class TrangChu extends StatefulWidget {
  const TrangChu({super.key});
  static Widget create() {
    return const TrangChu();
  }

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trang chu test menu'),
      ),
      body: const MainMenuScreen(),
    );
  }
}
