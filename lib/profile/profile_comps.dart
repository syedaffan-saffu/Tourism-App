import 'package:flutter/material.dart';

class ProfileComps2 {}

class CheckBox extends StatelessWidget {
  final bool? ischecked;
  final void Function(bool?) onpressed;
  const CheckBox({super.key, required this.ischecked, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      child: Checkbox(
          side: BorderSide.none,
          fillColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFFE6E6E6)),
          value: ischecked,
          checkColor: const Color(0xFF48B5E4),
          onChanged: onpressed),
    );
  }
}
