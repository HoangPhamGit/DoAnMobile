import 'package:app/components/components.dart';
import 'package:app/modules/xac_thuc_giay_to/xac_thuc_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class ChonLoaiXacThuc extends StatefulWidget {
  const ChonLoaiXacThuc({super.key});

  @override
  State<ChonLoaiXacThuc> createState() => _ChonLoaiXacThucState();
}

class _ChonLoaiXacThucState extends State<ChonLoaiXacThuc> {
  late XacThucChangeNotifier _notifier;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notifier = context.read<XacThucChangeNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'Chọn loại giấy tờ',
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(34, 14, 38, 1)),
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const Text('Lựa chọn loại giấy tờ tùy thân bạn muốn xác thực'),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(22, 88, 228, 0.1),
                borderRadius: BorderRadius.circular(8),
                border: const Border.fromBorderSide(
                  BorderSide(width: 1, color: Color.fromRGBO(22, 88, 228, 1)),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Can cuoc cong dan'),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Radio(
                            activeColor: const Color.fromRGBO(22, 88, 228, 1),
                            value: const [],
                            groupValue: const [],
                            onChanged: (value) {}),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/cccd_truoc.png',
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/cccd_sau.png',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            LoadingTextButton(
                controller: _notifier.buttonController,
                onPressed: () {
                  _notifier.onSubmit(context);
                },
                title: 'Bat dau xac thuc')
          ],
        ),
      ),
    );
  }
}
