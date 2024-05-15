import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trekkers_pk/profile/profile.dart';
import 'adventure/adv_card.dart';
import '../main.dart';
import '../profile/signinout/SignUp/signup.dart';
import '/reusabs/reusabs.dart';
import 'activities/activities.dart';
import 'guide/guide_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  bool get wantKeepAlive => true;
  bool _isregistered = true;
  List<bool> _favourite = [false, false, false, false, false];
  static const String image2 = "assets/images/gliding.png";
  static const String title = "Biafo Glacier Ice Climbing";
  static const String description =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter.";
  static const String price = "250";
  static const String rating = "4.5";

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: _isregistered
          ? AppBar(
              leadingWidth: contextwidth(context) * 0.25,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Image.asset(
                  "assets/images/logon.png",
                  fit: BoxFit.fill,
                ),
              ),
              backgroundColor: const Color(0xFFFFFFFF),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TapRegion(
                    onTapInside: (event) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Profile()));
                    },
                    child: const Badge(
                      offset: Offset(3, 3),
                      backgroundColor: Color(0xFFF7A81A),
                      label: Icon(
                        Icons.menu,
                        size: 9,
                        color: Color(0xFFFFFFFF),
                      ),
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                        backgroundColor: Color(0xFFAAFFAA),
                      ),
                    ),
                  ),
                )
              ],
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                height: contextheight(context) * 0.33,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/backlogo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 25.0, right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                fontWeight: FontWeight.w400,
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
                                SizedBox(
                                  height: 30,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0, vertical: 0.0),
                                        foregroundColor: const Color.fromARGB(
                                            213, 255, 255, 255),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        backgroundColor:
                                            const Color(0xfff7a81a)),
                                    onPressed: () {
                                      _isregistered
                                          ? () {}
                                          : mynavigatorKey.currentState!.push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUp()));
                                    },
                                    child: const Text(
                                      'Explore More',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13),
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
                  left: 20, top: 20, bottom: 2, right: 10),
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
                padding: const EdgeInsets.only(right: 17),
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.94),
                  clipBehavior: Clip.none,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AdvCard(
                          isregistered: _isregistered,
                        ));
                  },
                ),
              ),
            ),

            ///////////////////////////////////////////////////// Activities Section //////////////////////////
            /////////////////////////////////////////////////////////////////////////////////              ///
            ////////////////////////////////////////////////////////////////////////////////              ///

            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, bottom: 2, right: 10),
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
            //////////////////////////////////////////////////////////////////////////////////////////////
            //////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
                height: 520,
                child: Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.94),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ActivitiesCard(
                            isregistered: _isregistered,
                            index: index,
                            onwished: () {
                              setState(() {
                                _favourite[index] = !_favourite[index];
                              });
                              _favourite[index]
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text("Added to Wishlist")))
                                  : null;
                            },
                            favourite: _favourite,
                            img: image2,
                            description: description,
                            price: price,
                            title: title,
                            rating: rating,
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
                  left: 20, top: 20, bottom: 2, right: 10),
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
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.94),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const Padding(
                            padding: EdgeInsets.all(4.0), child: GuideCard());
                      }),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print('homescreen disposed');
    }
  }
}
