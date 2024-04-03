import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trekkers_pk/adv_places.dart';
import 'package:trekkers_pk/main.dart';
import '/reusabs/reusabs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  bool get wantKeepAlive => true;
  bool favourite = false;
  String image = "assets/images/mount.jpg";
  String image2 = "assets/images/gliding.png";
  String title = "Biafo Glacier Ice Climbing";
  String location = " Hindu Kush Range";
  static const String description =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter.";
  String price = "250";
  String rating = "4.5";
  String stay = "10";
  List<String> iconlist = [
    'assets/icons/car-icon.svg',
    "assets/icons/plane-icon.svg",
    'assets/icons/sign-icon.svg',
    'assets/icons/pump-icon.svg'
  ];
  List<String> locs_s = ['K-2', 'Nanga Parbat', 'Gasherbrum', 'undefine'];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                height: 370,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/backlogo.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    sbh(35),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            "DISCOVER A BEAUTIFUL",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Signika'),
                          ),
                          const Text(
                            "PLACE WITH US",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.2,
                                fontSize: 27,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontFamily: 'Signika'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              children: [
                                const Text(
                                  description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.5, color: Colors.white),
                                ),
                                sbh(8),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 0.0),
                                      foregroundColor: const Color.fromARGB(
                                          213, 255, 255, 255),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      backgroundColor: const Color(0xfff7a81a)),
                                  onPressed: () {},
                                  child: const Text(
                                    'Explore More',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),

//////////////////////////////////////////Adventure Section//////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////             ///
            /////////////////////////////////////////////////////////////////////////////             ///
            ///
            Padding(
              padding: const EdgeInsets.only(
                  left: 27, top: 20, bottom: 2, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ADVENTURE PLACES",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Signika'),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See More',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 21, 119, 200)),
                      )),
                ],
              ),
            ),
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.94),
                  clipBehavior: Clip.none,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          mynavigatorKey.currentState!.push(MaterialPageRoute(
                              builder: (context) => const Advplace()));
                        },
                        child: CardView(
                          img: image,
                          title: title,
                          locorating: Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.blue),
                              Text(location)
                            ],
                          ),
                          description: description,
                          price: price,
                          rating: rating,
                          stay: stay,
                          iconsrow: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: SvgPicture.asset(iconlist[0])),
                              const SizedBox(width: 10),
                              SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: SvgPicture.asset(iconlist[1])),
                              const SizedBox(width: 10),
                              SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: SvgPicture.asset(iconlist[2])),
                              const SizedBox(width: 10),
                              SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: SvgPicture.asset(iconlist[3])),
                            ],
                          ),
                          tags: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 55,
                                height: 23,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 208, 40),
                                      size: 15,
                                    ),
                                    Text(
                                      rating,
                                      style: const TextStyle(
                                        height: 1.0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 140,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 20, 92, 151)),
                                height: 45,
                                width: 40,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      stay,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 25,
                                          height: 1.2),
                                    ),
                                    const Text(
                                      'DAY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          height: 0.7,
                                          letterSpacing: 0.0,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          btnrow: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "\$$price",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
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
                                  shape: const RoundedRectangleBorder(),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Book Now',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        height: 1.4,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

///////////////////////////////////////////////////// Activities Section //////////////////////////
/////////////////////////////////////////////////////////////////////////////////              ///
////////////////////////////////////////////////////////////////////////////////              ///

            Padding(
              padding: const EdgeInsets.only(
                  left: 27, top: 20, bottom: 2, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ACTIVITIES",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Signika'),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See More',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 21, 119, 200)),
                      )),
                ],
              ),
            ),
///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
            SizedBox(
                height: 520,
                child: Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.94),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CardView(
                            img: image2,
                            title: title,
                            description: description,
                            price: price,
                            rating: rating,
                            tags: SizedBox(
                                height: 40,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: favourite
                                      ? Image.asset('assets/icons/wishlist.png')
                                      : Image.asset(
                                          'assets/icons/wished.png',
                                          fit: BoxFit.fill,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      favourite = !favourite;
                                    });
                                  },
                                )),
                            locorating: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 252, 157, 32),
                                    ),
                                    padding: const EdgeInsets.all(4.0),
                                    child: const Text(
                                      '8.0',
                                      style: TextStyle(
                                          color: Colors.white,
                                          height: 1.3,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text('Superb: 140 Reviews'),
                                ]),
                            locs: SizedBox(
                              height: 30,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 0.0),
                                          foregroundColor: const Color.fromARGB(
                                              213, 255, 255, 255),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          backgroundColor: Color.fromARGB(
                                              150 + (index * 50), 7, 141, 252),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          locs_s[index],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            btnrow: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10.0),
                                        backgroundColor: const Color.fromARGB(
                                            255, 51, 173, 226),
                                        elevation: 0.0,
                                        shape: const RoundedRectangleBorder()),
                                    onPressed: () {},
                                    child: const Text(
                                      'Read More',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          height: 0.0),
                                    )),
                                SizedBox(
                                    height: 20,
                                    child: Image.asset(
                                        'assets/icons/signals.png')),
                                const Text('45 persons doing it now')
                              ],
                            ),
                          ),
                        );
                      }),
                )),
/////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {},
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    SizedBox(
                      height: 340,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/upcoming.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 340,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/linegrad.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Up Coming Trip',
                            style: TextStyle(
                                color: Color.fromARGB(255, 105, 184, 249),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'BIAFO GLACIER ICE CLIMBING',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Signika',
                                fontSize: 30,
                                height: 1.3),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
//////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(
                  left: 27, top: 20, bottom: 2, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Trip Guides",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Signika'),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See More',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 21, 119, 200)),
                      )),
                ],
              ),
            ),
///////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.94),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: avatarcard(
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
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      backgroundColor: const Color.fromARGB(
                                          255, 51, 173, 226),
                                      elevation: 0.0,
                                      shape: const RoundedRectangleBorder()),
                                  onPressed: () {},
                                  child: const Text(
                                    'View Profile',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        height: 0.0),
                                  )),
                            ));
                      }),
                )),
          ],
        ),
      ),

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////2nd Stack//////////////////////////////////////////////
      Positioned(
        top: 40,
        right: 15,
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          foregroundColor: const Color.fromARGB(0, 0, 0, 0),
          onPressed: () {},
          child: PopupMenuButton(
            itemBuilder: (context) => [],
            iconColor: Colors.white,
            iconSize: 40,
          ),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print('homescreen disposed');
    }
  }
}
