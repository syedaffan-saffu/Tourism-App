import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../reusabs/reusabs.dart';
import 'guideprofile/guide_profile.dart';

class GuideCard extends StatelessWidget {
  final ElevatedButton btn;
  const GuideCard({super.key, required this.btn});

  @override
  Widget build(BuildContext context) {
    return guidecard(
      'assets/images/rawtrip.png',
      'assets/images/avatar.png',
      "Purpose of lorum Ipsum",
      'Tour Guide',
      'Pakistan',
      '2023',
      'Newyork',
      'Available',
      70,
      80,
      50,
      btn,
    );
  }
}

Card guidecard(
    String img,
    String avatarimg,
    String title,
    String occup,
    String location,
    String since,
    String nexttrip,
    String avail,
    int xp,
    int vent,
    int tripknow,
    ElevatedButton btn) {
  return Card(
    shape: const RoundedRectangleBorder(),
    color: const Color.fromARGB(255, 255, 255, 255),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(alignment: AlignmentDirectional.topStart, children: [
            Column(
              children: [
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 5.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 118,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.1),
                              ),
                              Text(
                                occup,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RatingBarIndicator(
                                    rating: 4,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Color(0xFFF7AA20),
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                  ),
                                  const Text(' / 4')
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'From',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Text(
                                location,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 41, 120, 44),
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Guide Since',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Text(
                              since,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.assistant_navigation,
                                  color: Color.fromARGB(255, 234, 188, 36),
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Next Trip',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Text(
                              nexttrip,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ]),
                      ///////////////////////////////////////////////////////////////////////////////////////////
                      const Divider(),
                      Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Experience',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: LinearPercentIndicator(
                                      percent: (xp / 100).toDouble(),
                                      progressColor: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    '${xp.toString()}%',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Venture',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: LinearPercentIndicator(
                                    percent: (vent / 100).toDouble(),
                                    progressColor: Colors.green,
                                  ),
                                ),
                                Text(
                                  '${vent.toString()}%',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Trip Knowledge',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: 80,
                                    child: LinearPercentIndicator(
                                      percent: (tripknow / 100).toDouble(),
                                      progressColor: Colors.yellow,
                                    )),
                                Text(
                                  '${tripknow.toString()}%',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        )
                      ]),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.adjust,
                                color: avail == 'Available'
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              sbw(5),
                              Text(
                                avail,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: btn,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 40,
              left: 15,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 10.0)
                    ]),
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(3.0),
                child: Badge(
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.bottomRight,
                  label: const Column(children: [
                    Text(
                      'TOP',
                      style: TextStyle(
                        fontSize: 10,
                        height: 0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Rated',
                      style: TextStyle(
                          fontSize: 7, fontWeight: FontWeight.w600, height: 0),
                    )
                  ]),
                  smallSize: 30,
                  largeSize: 35,
                  backgroundColor: const Color(0xFF0561AB),
                  child: ClipOval(
                    child: Image.asset(
                      avatarimg,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
  );
}
