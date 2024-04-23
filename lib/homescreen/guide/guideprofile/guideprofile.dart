import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'gprofilecomp/aboutus.dart';
import 'gprofilecomp/clients/clientsrev.dart';
import 'gprofilecomp/videos.dart';
import '../guideprofile/gprofilecomp/gprofilecomp.dart';
import '../../../reusabs/reusabs.dart';

class GuideProfile extends StatefulWidget {
  const GuideProfile({super.key});

  @override
  State<GuideProfile> createState() => _GuideProfileState();
}

GlobalKey<ScaffoldState> guideprofile = GlobalKey<ScaffoldState>();

class _GuideProfileState extends State<GuideProfile>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  int _selectedtab = 0;
  static const int trips = 20;
  TextStyle heading = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Signika");
  late TabController _tabController;
  final PageController _pageController = PageController();
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
  final List<double> _sectionOffsets = [
    0,
    700,
    1200,
    1900,
  ]; // Adjust these offsets according to your content

  static const String img = "assets/images/nexttripimg.png";
  static const String title = "Biafo Glacier Ice Climbing";
  static const String description =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter.";
  static const String price = "250";
  static const List<String> skills = [
    'Mountaineering',
    'Climbing',
    'Klettersteig or climbing',
    'Ski touring',
    'Snowshoeing',
    'Hiking Hillwalking',
    'Trekking',
    'Mountain biking (partly)',
  ];
  static const List<int> skillsperc = [
    80,
    50,
    50,
    50,
    50,
    50,
    50,
    50,
  ];

  void _scrollListener() {
    final double offset = _scrollController.offset;
    for (int i = 0; i < _sectionOffsets.length; i++) {
      if (offset >= _sectionOffsets[i] &&
          (i == _sectionOffsets.length - 1 ||
              offset < _sectionOffsets[i + 1])) {
        _tabController.animateTo(i);
        break;
      }
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();

    // _tabController.addListener(() {
    //   setState(() {
    //     _selectedtab = _tabController.index;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: guideprofile,
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 195,
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
                      child: Badge(
                        label: const SizedBox(
                          height: 10,
                          width: 8,
                        ),
                        backgroundColor: const Color(0xFFF7A81A),
                        alignment: Alignment.topRight,
                        offset: const Offset(-2, 2),
                        smallSize: 15,
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          hoverColor: const Color(0x00FFFFFF),
                          enableFeedback: false,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/message.svg',
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                          style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(5)),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Badge(
                    offset: const Offset(8, 4),
                    padding: const EdgeInsets.all(6.5),
                    label: const Column(children: [
                      Text(
                        'LEVEL',
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 7,
                            height: 0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'ONE',
                        softWrap: false,
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
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: heading,
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
                            color: Color(0xFF8B8B8B),
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
                    height: 900,
                    // _selectedtab == 0
                    // ? sizebox(800)
                    // : _selectedtab == 1
                    //     ? sizebox(780)
                    //     : _selectedtab == 2
                    //         ? sizebox(850)
                    //         : 820,
                    child: NestedScrollView(
                        headerSliverBuilder: (context, innerBoxIsScrolled) {
                          return [
                            SliverPersistentHeader(
                              floating: true,
                              delegate: _SliverAppBarDelegate(
                                TabBar(
                                    overlayColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors
                                            .transparent; // Set overlay color to transparent when pressed
                                      }
                                      // Otherwise, return null to use default behavior
                                      return const Color(0xFFFFFFFF);
                                    }),
                                    enableFeedback: false,
                                    onTap: (index) {
                                      _scrollController.animateTo(
                                        _sectionOffsets[index],
                                        duration:
                                            const Duration(milliseconds: 100),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
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
                              ),
                              pinned: true,
                            ),
                          ];
                        },
                        body: CustomScrollView(
                          controller: _scrollController,
                          slivers: [
                            SliverList(
                                delegate: SliverChildListDelegate([
                              AboutUs.aboutus(bio, _langs, phone, email, trips),
                              AboutUs.photos(),
                              const Videos(),
                              const CLientsReviews(),
                            ]))
                          ],
                        )
                        //  Column(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     TabBar(
                        //         overlayColor:
                        //             MaterialStateProperty.resolveWith<Color>(
                        //                 (Set<MaterialState> states) {
                        //           if (states.contains(MaterialState.pressed)) {
                        //             return Colors
                        //                 .transparent; // Set overlay color to transparent when pressed
                        //           }
                        //           // Otherwise, return null to use default behavior
                        //           return const Color(0xFFFFFFFF);
                        //         }),
                        //         enableFeedback: false,
                        //         onTap: (index) {
                        //           setState(() {
                        //             _selectedtab = index;
                        //             _pageController.animateToPage(_selectedtab,
                        //                 duration:
                        //                     (const Duration(milliseconds: 200)),
                        //                 curve: Curves.easeInOut);
                        //           });
                        //         },
                        //         labelPadding: const EdgeInsets.symmetric(
                        //           horizontal: 15,
                        //         ),
                        //         tabAlignment: TabAlignment.center,
                        //         indicatorColor: const Color(0xFF0561AB),
                        //         unselectedLabelStyle: const TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontFamily: "RedHat"),
                        //         labelStyle: const TextStyle(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold,
                        //             fontFamily: "RedHat"),
                        //         controller: _tabController,
                        //         tabs: const [
                        //           Tab(text: 'About Us'),
                        //           Tab(text: 'Photos'),
                        //           Tab(text: 'Videos'),
                        //           Tab(text: 'Clients Review'),
                        //         ]),
                        //     sbh(15),
                        //     Expanded(
                        //       child: PageView(
                        //         onPageChanged: (index) {
                        //           setState(() {
                        //             _selectedtab = index;
                        //             _tabController.animateTo(_selectedtab);
                        //           });
                        //         },
                        //         controller: _pageController,
                        //         children: [
                        //           AboutUs.aboutus(
                        //               bio, _langs, phone, email, trips),
                        //           AboutUs.photos(),
                        //           const Videos(),
                        //           const CLientsReviews(),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        ),
                  ),
                  Center(
                      child: Gcomponents.nexttripcard(
                          img, title, description, price)),
                  sbh(20),
                  Text(
                    "Skills",
                    style: heading,
                  ),
                  sbh(12),
                  Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                          skills.length,
                          (index) => Gcomponents.skillstile(
                              skills[index], skillsperc[index]))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double sizebox(double size) {
    const Duration(seconds: 3);
    return size;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
