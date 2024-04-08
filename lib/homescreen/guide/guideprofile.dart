import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

class GuideProfile extends StatefulWidget {
  const GuideProfile({super.key});

  @override
  State<GuideProfile> createState() => _GuideProfileState();
}

class _GuideProfileState extends State<GuideProfile>
    with TickerProviderStateMixin {
  TextStyle heading = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Signika");
  late TabController _tabController;
  static const String name = 'Robert Lewandowski';
  static const String about =
      'The purpose of lorem ipsum is to create a natural looking block of text.';
  static const String bio =
      'The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesnt distract from the layout. A practice not without laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.';
  static const String email = 'Robert Lewandowski@gmail.com';
  static const String phone = '0123 4567 890';
  static const String guide = "20";
  static const List<String> _langs = [
    'Urdu',
    'English',
    'Germany',
    'Chinese',
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 190,
              width: double.infinity,
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Colors.grey, BlendMode.modulate),
                      child: Image.asset(
                        'assets/images/guideprofback.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 20),
                      child: SizedBox(
                        height: 40,
                        width: 45,
                        child: Badge(
                          backgroundColor: const Color(0xFFF7A81A),
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.zero,
                          smallSize: 15,
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/message.svg',
                              fit: BoxFit.fill,
                            ),
                            style:
                                IconButton.styleFrom(padding: EdgeInsets.zero),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Badge(
                    padding: const EdgeInsets.all(6.5),
                    label: const Column(children: [
                      Text(
                        'Level',
                        style: TextStyle(
                            fontSize: 8,
                            height: 0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'ONE',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            height: 0),
                      )
                    ]),
                    smallSize: 30,
                    largeSize: 37,
                    backgroundColor: const Color(0xFFF7AA20),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFE7E7E7),
                        shape: BoxShape.circle,
                      ),
                      height: 115,
                      width: 115,
                      padding: const EdgeInsets.all(1.5),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/avatar.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Signika'),
                  ),
                  const Text(
                    about,
                    style: TextStyle(
                        color: Color(0xFF5D6366), fontWeight: FontWeight.w600),
                  ),
                  const Row(
                    children: [
                      Text(
                        'Guide : ',
                        style: TextStyle(
                            color: Color(0xFF6B6C6C),
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            height: 1.8),
                      ),
                      Text(
                        "$guide years old",
                        style: TextStyle(
                            color: Color(0xFF5D6366),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  RatingBarIndicator(
                    rating: 4,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Color(0xFFF7AA20),
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                  ),
                  sbh(20),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: Column(
                      children: [
                        TabBar(
                            labelPadding: const EdgeInsets.only(right: 30),
                            tabAlignment: TabAlignment.center,
                            indicatorColor: const Color(0xFF0561AB),
                            unselectedLabelStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "RedHat"),
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "RedHat"),
                            controller: _tabController,
                            tabs: const [
                              Tab(text: 'About Us'),
                              Tab(text: 'Photos'),
                              Tab(text: 'Videos'),
                              Tab(text: 'Clients Review'),
                            ]),
                        sbh(15),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('GUIDE BIO', style: heading),
                                  sbh(10),
                                  const Text(
                                    bio,
                                    style: TextStyle(
                                      color: Color(0xFF848484),
                                    ),
                                  ),
                                  sbh(20),
                                  Text("LANGUAGES", style: heading),
                                  sbh(15),
                                  Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: List.generate(
                                          4,
                                          (index) =>
                                              _langtiles(_langs[index]))),
                                  sbh(30),
                                  Text("PERSONAL DETAILS", style: heading),
                                  sbh(15),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Color(0xFF48B5E4),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        phone,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  sbh(10),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Color(0xFF1C954B),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        email,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Center(child: Text('Photos')),
                              const Center(child: Text('Videos')),
                              const Center(child: Text('Clients')),
                            ],
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
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _langtiles(String language) {
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
}
