import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../utils/reusabs.dart';

class Gcomponents {
  static TextStyle heading = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Signika");

  static Widget skillstile(String skill, int percent) {
    List<Color> colors = [
      const Color(0xFF0561AB),
      const Color(0xFF393939),
      const Color(0xFF48B5E4),
      const Color(0xFFF7A81A),
      const Color(0xFF1C954B)
    ];
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            border: Border.all(
                width: 1.5,
                color: const Color(0xFFE8E8E8),
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            Text(
              skill,
              style: const TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  height: 1.3),
            ),
            sbw(7),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: colors[Random().nextInt(colors.length)],
              ),
              height: 20,
              child: Text(
                '${percent.toString()}%',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    height: 1.0,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget nexttripcard(
      String img, String title, String description, String price) {
    return Card(
      shape: const RoundedRectangleBorder(),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(

            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEXT TOUR',
                    style:
                        heading.copyWith(fontSize: 22, fontFamily: "Signika"),
                  ),
                  sbh(10),
                  SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Icon(
                            CustomIcons.car_icon,
                            color: Color(0xFF48B5E4),
                          )),
                      SizedBox(width: 10),
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Icon(
                            CustomIcons.pump_icon,
                            color: Color(0xFF48B5E4),
                          )),
                      SizedBox(width: 10),
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Icon(
                            CustomIcons.sign_icon,
                            color: Color(0xFF48B5E4),
                          )),
                      SizedBox(width: 10),
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Icon(
                            CustomIcons.plane_icon,
                            color: Color(0xFF48B5E4),
                          )),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sbh(7),
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    sbh(7),
                    Text(
                      description,
                      style:
                          const TextStyle(color: Color.fromARGB(132, 0, 0, 0)),
                    ),
                    sbh(15),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$$price",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "/Person",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(132, 0, 0, 0)),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 10.0),
                                  backgroundColor:
                                      const Color.fromARGB(255, 51, 173, 226),
                                  elevation: 0.0,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)))),
                              onPressed: () {},
                              child: const Text(
                                'Book Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    height: 0.0),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
