import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../utils/utilspack1.dart';

class ProfEditComps {
  static Widget langTile(List<String> languages, List<String> languageLevels,
      int index, void Function() onpressed) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
        foregroundColor: const Color.fromARGB(213, 255, 255, 255),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromARGB(255, 155, 212, 247)),
            borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: const Color.fromARGB(111, 189, 233, 255),
      ),
      onPressed: onpressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 5.0, bottom: 5.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languages[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black,
                    height: 0.0,
                  ),
                ),
                Text(
                  languageLevels[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.grey,
                      height: 0.0),
                ),
              ],
            ),
            gapH(5),
            SizedBox(
                height: 25, child: Image.asset('assets/icons/crossicon.png'))
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? value;
  final void Function(String?) onpressed;
  const DropDown(
      {super.key,
      required this.title,
      required this.items,
      required this.value,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(title),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  enabled: true,
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: value,
        onChanged: onpressed,
        buttonStyleData: ButtonStyleData(
          height: 40,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromARGB(255, 212, 212, 212),
              ),
              color: Colors.white70),
          elevation: 0,
        ),
        dropdownStyleData: const DropdownStyleData(elevation: 0, width: 150),
        menuItemStyleData: const MenuItemStyleData(
          height: 30,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
