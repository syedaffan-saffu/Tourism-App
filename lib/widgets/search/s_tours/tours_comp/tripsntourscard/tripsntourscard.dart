import 'package:flutter/material.dart';

import '../../../../../utils/utilspack1.dart';

class TnTCard extends StatelessWidget {
  const TnTCard({super.key});
  static const String title =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.";

  static const List<IconData> icons = [
    CustomIcons.car_icon,
    CustomIcons.pump_icon,
    CustomIcons.sign_icon,
    CustomIcons.plane_icon,
  ];
  static const double rating = 4.5;
  static const int days = 7;

  static const String desc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullam.";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: contextwidth(context) * 0.8,
      child: Badge(
        smallSize: 20,
        largeSize: 25,
        alignment: Alignment.topRight,
        padding: const EdgeInsets.symmetric(horizontal: 7),
        offset: const Offset(-40, 15),
        backgroundColor: const Color(0xFFFFFFFF),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.star,
              size: 16,
              color: Color(0xFFF7AA20),
            ),
            Text(
              rating.toString(),
              style: const TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            )
          ],
        ),
        child: Card(
          elevation: 0,
          shape: const BeveledRectangleBorder(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: contextheight(context) * 0.25,
              width: double.infinity,
              child: Image.asset(
                'assets/images/tripntours.png',
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            gapV(10),
            Row(
                children: List.generate(
                    4,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: iconsRow(icons[index]),
                        ))),
            gapV(10),
            const Text(
              "Duration: $days Days",
              style: TextStyle(
                  color: Color(
                    0xFFABAAAA,
                  ),
                  fontSize: 16),
            ),
            const Text(desc),
          ]),
        ),
      ),
    );
  }

  Widget iconsRow(IconData icon) {
    return SizedBox(
        height: 24,
        width: 24,
        child: Icon(
          icon,
          color: const Color(0xFFF6AA21),
        ));
  }
}
