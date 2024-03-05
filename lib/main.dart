import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trekkers_pk/reusabs.dart';

// import 'reusabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'segaon',
        // primaryColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color.fromARGB(233, 255, 255, 255),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                    padding: const EdgeInsets.only(top: 50.0, left: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        sbh(35),
                        const Center(
                          child: Column(
                            children: [
                              Text(
                                "DISCOVER A BEAUTIFUL",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "PLACE WITH US",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "ADVENTURE PLACES",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
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
                SizedBox(
                  height: 450,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: InkWell(
                          hoverColor: Colors.white70,
                          onTap: () {},
                          child: SizedBox(
                            height: 340,
                            width: 300,
                            child: Column(

                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                  height: 190,
                                                  width: double.infinity,
                                                  child: Image.asset(
                                                    'assets/images/mount.jpg',
                                                    fit: BoxFit.fill,
                                                  )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                  height: 25,
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      SizedBox(
                                                          height: 25,
                                                          width: 25,
                                                          child: SvgPicture.asset(
                                                              'assets/icons/car-icon.svg')),
                                                      const SizedBox(width: 10),
                                                      SizedBox(
                                                          height: 25,
                                                          width: 25,
                                                          child: SvgPicture.asset(
                                                              'assets/icons/plane-icon.svg')),
                                                      const SizedBox(width: 10),
                                                      SizedBox(
                                                          height: 25,
                                                          width: 25,
                                                          child: SvgPicture.asset(
                                                              'assets/icons/sign-icon.svg')),
                                                      const SizedBox(width: 10),
                                                      SizedBox(
                                                          height: 25,
                                                          width: 25,
                                                          child: SvgPicture.asset(
                                                              'assets/icons/pump-icon.svg')),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                          '4.5',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 125,
                                                  ),
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    9,
                                                                    104,
                                                                    182)),
                                                    height: 45,
                                                    width: 40,
                                                    child: const Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          '10',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 23,
                                                              height: 1.2),
                                                        ),
                                                        Text(
                                                          'DAY',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              height: 0.7,
                                                              letterSpacing:
                                                                  0.0),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              )
                                            ],
                                          ),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        sbh(7),
                                        const Text(
                                          'Biafo Glacier Ice Climbing',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                        sbh(7),
                                        const Row(
                                          children: [
                                            Icon(Icons.location_on,
                                                color: Colors.blue),
                                            Text(' Hindu Kush Range')
                                          ],
                                        ),
                                        sbh(7),
                                        const Text(
                                          "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout.",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(132, 0, 0, 0)),
                                        ),
                                        sbh(15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Row(
                                              children: [
                                                Text(
                                                  "\$250",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "/Person",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          132, 0, 0, 0)),
                                                ),
                                              ],
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 51, 173, 226),
                                                    elevation: 0.0,
                                                    shape:
                                                        const RoundedRectangleBorder()),
                                                onPressed: () {},
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12),
                                                  child: Text(
                                                    'Book Now',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ]),
        ),
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
      ]),
    );
  }
}
