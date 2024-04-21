import 'package:app/components/components.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class DiaChiChange extends StatefulWidget {
  const DiaChiChange({super.key});

  @override
  State<DiaChiChange> createState() => _DiaChiChangeState();
}

class _DiaChiChangeState extends State<DiaChiChange> {
  List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '37',
    '48',
    '29',
    '30',
    '41'
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
                  'Thay đổi địa chỉ',
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
            "Tinh/Thanh Pho",
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
          const SizedBox(
            height: 16,
          ),
          Text(
            "Phuong xa",
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
          const SizedBox(
            height: 16,
          ),
          Text(
            "Quan/huyen",
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
          const SizedBox(
            height: 16,
          ),
          Text(
            "Tên đường, số nhà, Tòa nhà",
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
          const FssTextField(
            hintText: 'Nơi ở hiện tại',
          ),
          const SizedBox(
            height: 16,
          ),
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
