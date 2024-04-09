import 'package:flutter/material.dart';

import '../../../reusabs/reusabs.dart';

class Gcomponents {
  static TextStyle heading = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Signika");

  static Widget aboutus(
      String bio, List<String> langs, String phone, String email, int trips) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('GUIDE BIO', style: heading),
        sbh(10),
        Text(
          bio,
          style: const TextStyle(
            color: Color(0xFF848484),
          ),
        ),
        sbh(20),
        Text("LANGUAGES", style: heading),
        sbh(15),
        Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(4, (index) => _langtiles(langs[index]))),
        sbh(30),
        Text("PERSONAL DETAILS", style: heading),
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
            Text("RECENT TRIPS ", style: heading),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: 80 + (language.length * 4.5),
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
    );
  }

  static Widget nexttripcard(
      String img, String title, String description, String price) {
    return Card(
      shape: const RoundedRectangleBorder(),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        width: 330,
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
                                  shape: const RoundedRectangleBorder()),
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
