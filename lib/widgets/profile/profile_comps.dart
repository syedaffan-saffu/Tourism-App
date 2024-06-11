import 'package:flutter/material.dart';

import '../../utils/utilspack1.dart';

class ProfileComps2 {
  static Widget licandcert(
      {required void Function() onpresssed, required bool isuploaded}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFF1F1F1),
      ),
      height: 50,
      padding: const EdgeInsets.all(5.0),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: onpresssed,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0561AB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: Text(
              isuploaded ? "Change" : "Upload",
              style: const TextStyle(color: Color(0xFFFFFFFF)),
            ),
          ),
          isuploaded
              ? Row(
                  children: [
                    const Text("Uploaded"),
                    sbw(10),
                    const Icon(
                      Icons.check_box,
                      color: Color(0xFF66CC00),
                    )
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

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
