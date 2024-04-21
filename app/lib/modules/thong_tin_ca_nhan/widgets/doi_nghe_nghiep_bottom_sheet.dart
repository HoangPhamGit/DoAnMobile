import 'package:app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class NgheNghiepChange extends StatefulWidget {
  const NgheNghiepChange({super.key});

  @override
  State<NgheNghiepChange> createState() => _NgheNghiepChangeState();
}

class _NgheNghiepChangeState extends State<NgheNghiepChange> {
  List<String> items = [
    'Nghề 1',
    'Nghề 2',
    'Nghề 3',
    'Nghề 4',
    'Nghề 5',
    'Nghề 6',
    'Nghề 7',
  ];
  String? selectedItem = '1';
  LoadingTextButtonController btnController = LoadingTextButtonController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                ),
              ),
              Expanded(
                child: Text(
                  'Thay Nghề Nghiệp',
                  textAlign: TextAlign.center,
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleMedium!
                      .copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 32,
            color: Colors.black.withOpacity(0.05),
          ),
          Text(
            "Nghề nghiệp",
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodySmall!
                .copyWith(
                  color: const Color.fromRGBO(3, 14, 38, 0.6),
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          buildDropDownButton(context: context, item: items),
          const Spacer(),
          LoadingTextButton(
              controller: btnController, onPressed: () {}, title: 'Xác Nhận')
        ],
      ),
    );
  }
}

Widget buildDropDownButton(
    {required BuildContext context, required List item}) {
  return SizedBox(
      width: double.maxFinite,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(3, 14, 38, 0.05))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(3, 14, 38, 0.05))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(3, 14, 38, 0.05))),
          ),
          value: item[1],
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 24,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
          elevation: 2,
          items: item
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (item) {}));
}
