import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/widgets/homescreen/hmscrncomps.dart';
import 'package:trekkers_pk/backend/router/routes.dart';
import '../../../../backend/provider/providers.dart';
import 'gprofile_elements/aboutus.dart';
import 'gprofile_elements/clients/clientsrev.dart';
import 'gprofile_elements/videos/thumbnails.dart';
import 'gprofile_elements/gprofilecomp.dart';
import '../../../../utils/reusabs.dart';

class GuidesProfile extends StatefulWidget {
  const GuidesProfile({super.key});

  @override
  State<GuidesProfile> createState() => _GuidesProfileState();
}

class _GuidesProfileState extends State<GuidesProfile>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;

  static const int trips = 20;
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
  final List<double> _sectionOffsets = [
    250,
    1000,
    1700,
    2500,
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    final gorouter = GoRouter.of(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final indexprovider = Provider.of<IndexProvider>(context);
    return Scaffold(
        appBar: authProvider.isLoggedIn
            ? HmComps.hmappbar(
                context: context,
                ontap: (event) {
                  gorouter.go('/profile');
                  setState(() {
                    indexprovider.changeindex(3);
                  });
                },
                img: "assets/images/avatar.png")
            : null,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              surfaceTintColor: const Color(0xFFFFFFFF),
              primary: false,
              collapsedHeight: 40,
              toolbarHeight: 0,
              backgroundColor: const Color(0xFFFFFAFF),
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: contextheight(context) / 2.25,
              bottom: TabBar(
                  overlayColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.transparent;
                    }

                    return const Color(0xFFFFFFFF);
                  }),
                  onTap: (index) {
                    _scrollController.animateTo(
                      _sectionOffsets[index],
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                    );
                  },
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  tabAlignment: TabAlignment.center,
                  indicatorColor: const Color(0xFF0561AB),
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontFamily: "RedHat"),
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
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                expandedTitleScale: 1.5,
                background: SizedBox(
                  height: 295,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Stack(children: [
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
                              padding:
                                  const EdgeInsets.only(top: 10, right: 20),
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
                          top: 80,
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
                      const SizedBox(
                        height: 1,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 15.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: Gcomponents.heading,
                                ),
                                const Text(
                                  about,
                                  style: TextStyle(
                                      color: Color(0xFF5D6366),
                                      fontWeight: FontWeight.w600),
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
                                    itemSize: 15,
                                    rating: 4,
                                    itemBuilder: (context, index) => const Icon(
                                          Icons.star,
                                          color: Color(0xFFF7AA20),
                                        ))
                              ]))
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              sbh(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AboutUs.aboutus(bio, _langs, phone, email, trips),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AboutUs.photos(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: contextheight(context),
                  child: Thumbnails(
                    skey: rootNavigatorKey,
                  ),
                ),
              ),
              // const Videos(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CLientsReviews(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                    child: Gcomponents.nexttripcard(
                        img, title, description, price)),
              ),
              sbh(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Skills",
                  style: Gcomponents.heading,
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                        skills.length,
                        (index) => Gcomponents.skillstile(
                            skills[index], skillsperc[index]))),
              ),
            ]))
          ],
        ));
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
