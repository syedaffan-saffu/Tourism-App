import 'package:flutter/material.dart';
import 'package:trekkers_pk/widgets/search/s_tours/tours_comp/tripsntourscard/tripsntourscard.dart';

import '../../../../utils/utilspack1.dart';

double _screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

const List<String> _images = [
  "assets/images/tour1.png",
  "assets/images/tour2.png",
  "assets/images/tour3.png",
  "assets/images/tour4.png"
];

class Accordion extends StatefulWidget {
  const Accordion({super.key});

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  static const List<String> _lastrow = [
    'TOURS AND TRIPS',
    'FOOD',
    'STAY',
    'SHOPPING'
  ];
  static const List<IconData> _icons = [
    Planeicon.tripplane2,
    TripsnTours.food,
    TripsnTours.stay,
    TripsnTours.shop
  ];
  List<Widget> widgets(BuildContext tcontext) {
    return [
      SizedBox(
        height: MediaQuery.sizeOf(tcontext).height * 0.6,
        child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: PageView.builder(
              clipBehavior: Clip.none,
              controller: PageController(viewportFraction: 0.99),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (tcontext, index) {
                return const TnTCard();
              }),
        ),
      ),
      const SizedBox(
        height: 100,
        child: Text('food'),
      ),
      const SizedBox(
        height: 100,
        child: Text('Stay'),
      ),
      const SizedBox(
        height: 100,
        child: Text('Shop'),
      ),
    ];
  }

  bool expandedPanel = false;
  final TextStyle heading = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Signika");
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
        elevation: 0,
        expandedHeaderPadding: const EdgeInsets.all(0),
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            expandedPanel = !expandedPanel;
          });
        },
        children: List.generate(
          4,
          (index) => ExpansionPanelRadio(
              value: index,
              canTapOnHeader: true,
              headerBuilder: (context, isOpen) {
                return Container(
                  padding: isOpen
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.all(0),
                  color: isOpen
                      ? const Color(0xFF0561AB)
                      : const Color(0xFFFFFFFF),
                  width: double.maxFinite,
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(
                          _icons[index],
                          color: isOpen
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF000000),
                        ),
                      ),
                      gapH(15),
                      Text(
                        _lastrow[index],
                        style: heading.copyWith(
                            color: isOpen
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF000000)),
                      )
                    ],
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: widgets(context)[index],
              )),
        ));
  }
}

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
          width: (contextwidth(context) / 2) - 3,
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
              SizedBox(
                height: 140,
                width: (MediaQuery.of(context).size.width / 2) - 3,
                child: Image.asset(
                  _images[3],
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.darken,
                  color: const Color(0x6F000000),
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
