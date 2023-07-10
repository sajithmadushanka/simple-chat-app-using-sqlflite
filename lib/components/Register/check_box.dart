import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCheckBox extends StatefulWidget {
  final bool value_;
  final Function isChecked;
  const MyCheckBox({super.key, required this.value_, required this.isChecked});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.4,
          child: Checkbox(
            value: widget.value_,
            onChanged: (value) {
              widget.isChecked();
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'termOfsService'.tr,
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              'term&service'.tr,
              style: const TextStyle(color: Colors.blue),
            )
          ],
        )
      ],
    );
  }
}
