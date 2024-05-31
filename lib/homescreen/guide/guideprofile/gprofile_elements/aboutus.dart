import 'package:flutter/material.dart';
import 'gprofilecomp.dart';

import '../../../../utils/reusabs.dart';

class AboutUs {
  static const String tripname = "BIAFO GLACIER ICE CLIMBING";

  static const String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

  static const String gimgname = "Gul Lasht Zom Ice Climbing";

  static Widget aboutus(
      String bio, List<String> langs, String phone, String email, int trips) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('GUIDE BIO', style: Gcomponents.heading),
        sbh(10),
        Text(
          bio,
          style: const TextStyle(
            color: Color(0xFF848484),
          ),
        ),
        sbh(20),
        Text("LANGUAGES", style: Gcomponents.heading),
        sbh(15),
        Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(4, (index) => _langtiles(langs[index]))),
        sbh(30),
        Text("PERSONAL DETAILS", style: Gcomponents.heading),
        sbh(15),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Color(0xFF48B5E4),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              phone,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        sbh(10),
        Row(
          children: [
            const Icon(
              Icons.email,
              color: Color(0xFF1C954B),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        sbh(20),
        Row(
          children: [
            Text("RECENT TRIPS ", style: Gcomponents.heading),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF48B5E4),
              ),
              child: Text(
                trips.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        sbh(10),
        Column(
            children: List.generate(
                3,
                (index) => _recenttrips('BIAFO GLACIER ICE CLIMBING', "23-2-24",
                    "assets/images/tripthumb.png")))
      ],
    );
  }

  static Widget _recenttrips(
    String tripname,
    String date,
    String image,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: const Color(0xFFEEF8FF),
        onTap: () {},
        leading: Image.asset(image),
        title: Text(
          tripname,
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontFamily: "Signika", fontSize: 16),
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.calendar_today,
              size: 16,
            ),
            sbw(10),
            Text(
              date,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _langtiles(String language) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.5,
                color: const Color(0xFF0561AB),
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              size: 18,
              color: Color(0xFF0561AB),
            ),
            sbw(10),
            Text(
              language,
              style: const TextStyle(
                  color: Color(0xFF514D4D),
                  fontWeight: FontWeight.w600,
                  height: 1.3),
            ),
          ],
        ),
      ),
    );
  }

  static Widget photos() {
    const List<String> photos = [
      'assets/images/gimg1.png',
      'assets/images/gimg2.png',
      'assets/images/gimg3.png',
      'assets/images/gimg4.png',
    ];
    SizedBox picframe(String photo) {
      return SizedBox(
        height: 140,
        width: 175,
        child: Image.asset(
          photo,
          fit: BoxFit.fill,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tripname,
          style: Gcomponents.heading,
        ),
        sbh(12),
        const Text(description),
        sbh(20),
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      Color(0x71161616), BlendMode.darken),
                  child: SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: Image.asset(
                      'assets/images/gimg.jpeg',
                      fit: BoxFit.fill,
                    ),
                  )),
              Center(
                child: SizedBox(
                  width: 200,
                  child: Text(
                    tripname,
                    textAlign: TextAlign.center,
                    style: Gcomponents.heading.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        sbh(10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              List.generate(photos.length, (index) => picframe(photos[index])),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SizedBox(
        //       height: 140,
        //       width: 175,
        //       child: Image.asset(
        //         'assets/images/gimg1.png',
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 140,
        //       width: 175,
        //       child: Image.asset(
        //         'assets/images/gimg2.png',
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //   ],
        // ),
        // sbh(12),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SizedBox(
        //       height: 140,
        //       width: 175,
        //       child: Image.asset(
        //         'assets/images/gimg3.png',
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 140,
        //       width: 175,
        //       child: Image.asset(
        //         'assets/images/gimg4.png',
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //   ],
        // ),
        TextButton(onPressed: () {}, child: const Text("See More"))
      ],
    );
  }
}
