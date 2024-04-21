import 'package:flutter/material.dart';

class ItemService extends StatefulWidget {
  final String? imagePath;
  final String? serviceName;
  final bool? showIcon;
  final bool? check;
  const ItemService(
      {super.key,
      this.imagePath,
      this.serviceName,
      this.showIcon = true,
      this.check});

  @override
  State<ItemService> createState() => _ItemServiceState();
}

class _ItemServiceState extends State<ItemService> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 327,
        height: 32,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.imagePath ?? '',
                  width: 32,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(widget.serviceName ?? ''),
              ],
            ),
            if (widget.showIcon ?? false)
              const SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),
            if (widget.check ?? false)
              const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.check,
                    color: Color(0xff1658E4),
                  ))
          ],
        ));
  }
}
