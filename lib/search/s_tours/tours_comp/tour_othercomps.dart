import 'package:flutter/material.dart';

double _screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

const List<String> _images = [
  "assets/images/tour1.png",
  "assets/images/tour2.png",
  "assets/images/tour3.png",
  "assets/images/tour4.png"
];

class ImageRows {
  static Widget fstrow(BuildContext context) {
    double firstImageRatio = 1.8 / 3;
    double secondImageRatio = 1 - firstImageRatio;
    double first = _screenWidth(context) * firstImageRatio - 6;
    double second = _screenWidth(context) * secondImageRatio;
    List<double> widths = [first, second];
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          2,
          (index) => SizedBox(
            height: 140,
            width: widths[index],
            child: Image.asset(
              _images[index],
              fit: BoxFit.fill,
            ),
          ),
        ));
  }

  static Widget scndrow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 140,
          width: (MediaQuery.of(context).size.width / 2) - 3,
          child: Image.asset(
            _images[2],
            fit: BoxFit.fill,
          ),
        ),
        TapRegion(
          onTapInside: (event) {
            print("pressed");
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Color(0x90090909), BlendMode.darken),
                child: SizedBox(
                  height: 140,
                  width: (MediaQuery.of(context).size.width / 2) - 3,
                  child: Image.asset(
                    _images[3],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Text(
                "View More",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
