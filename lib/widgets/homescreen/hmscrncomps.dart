import 'package:flutter/material.dart';

import '../../utils/reusabs.dart';

class HmComps {
  static AppBar hmappbar(
      {required BuildContext context,
      required void Function(PointerDownEvent) ontap,
      required String img}) {
    return AppBar(
      leadingWidth: contextwidth(context) * 0.25,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10),
        child: Image.asset(
          "assets/images/logon.png",
          fit: BoxFit.fill,
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: TapRegion(
            onTapInside: ontap,
            child: Badge(
              offset: const Offset(3, 3),
              backgroundColor: const Color(0xFFF7A81A),
              label: const Icon(
                Icons.menu,
                size: 9,
                color: Color(0xFFFFFFFF),
              ),
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundImage: AssetImage(img),
                backgroundColor: const Color(0xFFAAFFAA),
              ),
            ),
          ),
        )
      ],
    );
  }
}
