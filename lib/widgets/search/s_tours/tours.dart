import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trekkers_pk/utils/utilspack1.dart';

import 'tours_comp/likedislike.dart';
import 'tours_comp/tour_othercomps.dart';

const String _mainloc = "Pakistan";

class Tours extends StatelessWidget {
  const Tours({super.key});
  static const String _province = "Gilgit-Baltistan";
  static const String _slctdtour = "SKARDU";
  static const int _reviews = 234;
  static const double _rating = 3;

  static const String desc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  final TextStyle heading = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Signika");
  static TextStyle bodystyle = const TextStyle(
      color: Color(0xFF4E4E4E), fontSize: 15, fontWeight: FontWeight.w500);

  static const List<String> lastrow = ['FOOD', 'STAY', 'SHOPPING'];
  static const List<String> iconsxsvg = [
    'assets/icons/food.svg',
    'assets/icons/stay.svg',
    'assets/icons/shop.svg'
  ];

  static const List<IconData> icons2 = [
    TripsnTours.food,
    TripsnTours.stay,
    TripsnTours.shop
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(children: [
          ImageRows.fstrow(context),
          sbh(6),
          ImageRows.scndrow(context),
          sbh(5),
          Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("$_mainloc > $_province"),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: _rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Color(0xFFF7AA20),
                        ),
                        itemCount: 5,
                        itemSize: 17.0,
                      ),
                      Text(" / ${_reviews.toString()}")
                    ],
                  )
                ],
              ),
              sbh(20),
              Text(
                "ABOUT $_slctdtour",
                style: heading.copyWith(fontSize: 24),
              ),
              Text(
                desc,
                style: bodystyle,
              ),
              sbh(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 20,
                        color: Color(0xFF48B5E4),
                      ),
                      Text(
                        " $_province, $_mainloc",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  LikeDislike(),
                ],
              ),
              sbh(30),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   color: const Color(0xFF0561AB),
              //   width: double.maxFinite,
              //   height: 50,
              //   child: Row(
              //     children: [
              //       const Icon(
              //         Planeicon.tripplane2,
              //         size: 28,
              //         color: Color(0xFFFFFFFF),
              //       ),
              //       sbw(15),
              //       Text(
              //         "TOURS AND TRIPS",
              //         style: heading.copyWith(color: const Color(0xFFFFFFFF)),
              //       )
              //     ],
              //   ),
              // ),
              // sbh(20),
              // SizedBox(
              //   height: MediaQuery.sizeOf(context).height * 0.6,
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 50),
              //     child: PageView.builder(
              //         clipBehavior: Clip.none,
              //         controller: PageController(viewportFraction: 0.99),
              //         scrollDirection: Axis.horizontal,
              //         itemCount: 5,
              //         itemBuilder: (context, index) {
              //           return const TnTCard();
              //         }),
              //   ),
              // ),
              // sbh(20),
              const Accordion(),
            ]),
          )
        ]),
      ),
    );
  }
}
