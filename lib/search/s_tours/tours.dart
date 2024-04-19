import 'package:flutter/material.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

class Tours extends StatelessWidget {
  const Tours({super.key});
  static const List<double> ratios = [1.7, 2.4];
  static const List<String> images = [
    "assets/images/tour1.png",
    "assets/images/tour2.png",
    "assets/images/tour3.png",
    "assets/images/tour4.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(children: [
        SizedBox(
          height: 140,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  2,
                  (index) =>
                      ImageRows.fstrow(images[index], ratios[index], context))),
        ),
        sbh(6),
        SizedBox(
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                2, (index) => ImageRows.scndrow(images[index + 2], context)),
          ),
        )
      ]),
    );
  }
}

class ImageRows {
  static Widget fstrow(String image, double ratio, BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: (MediaQuery.of(context).size.width / ratio) - 2.5,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }

  static Widget scndrow(String image, BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: (MediaQuery.of(context).size.width / 2) - 2.5,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
