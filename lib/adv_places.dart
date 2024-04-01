import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trekkers_pk/reusabs.dart';

import 'indicator.dart';

class Advplace extends StatefulWidget {
  const Advplace({super.key});

  @override
  State<Advplace> createState() => _AdvplaceState();
}

class _AdvplaceState extends State<Advplace> {
  int _slctdbtn = 0;
  List<String> btnnames = ['Day-to-day', 'Included', 'Important'];
  int? _selectedsec;
  Color greycolor = const Color.fromARGB(255, 209, 209, 209);
  int sections = 5;
  final List<Color> seccolors = [
    const Color(0xFFDA1C5C),
    const Color(0xFF262262),
    const Color(0xFFF7941D),
    const Color(0xFF1B75BC),
    const Color(0xFF39B54A),
  ];
  final List<String> hlts = [
    'Climb the Diamond Hill',
    'Hike at Cliffs of Moher',
    'Sightseeing Ring of Kerry',
    'Visit Cahir Castle',
    'Atmospheric Dublin and Galway'
  ];

  final List<String> legends = [
    'Sightseeing',
    'Culture',
    'Venture',
    'Knowledge',
    'Food',
  ];
  final Map<IconData, String> iconMap = {
    CustomIcons.car_icon: 'Transport',
    CustomIcons.plane_icon: 'Incl.flight',
    CustomIcons.sign_icon: '18 - 26 Years  ',
    CustomIcons.peoples: '18 - 26 Years',
    CustomIcons.luggage: 'Excl. luggage',
    CustomIcons.persons: '10 days',
    CustomIcons.hotel: 'Hotel',
    CustomIcons.couple: '15-28 people',
    CustomIcons.binoculars: '9 Excursions ',
    CustomIcons.difficulty: 'Normal Difficulty',
  };

  int _selectedIndex = 0;

  // final List<IconData> icons = [
  //   Icons.home,
  //   Icons.work,
  //   Icons.shopping_cart,
  //   Icons.favorite,
  //   Icons.school,
  // ];

  // final List<String> suggestions = [
  //   'Home',
  //   'Work',
  //   'Shopping',
  //   'Favorites',
  //   'School',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/glacier.png',
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: "RedHat"),
                        children: [
                          TextSpan(
                            text: 'Biafo Glacier Ice Climbing\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.white),
                          ),
                          WidgetSpan(
                            child: SizedBox(height: 20),
                          ),
                          TextSpan(
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          WidgetSpan(
                            child: SizedBox(height: 30),
                          ),
                          TextSpan(
                            text: 'From  1706.50 €',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            sbh(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: greycolor,
                    )),
                    height: 236,
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: double.maxFinite,
                        color: Colors.blue[800],
                        child: const Text(
                          'Highlights',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                5,
                                (index) => Row(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      child: Image.asset(
                                          'assets/icons/check_icon.png'),
                                    ),
                                    sbw(8), // Adjust the width as needed
                                    Text(
                                      hlts[index],
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          height: 1.6),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            sbh(10),
                            SizedBox(
                              height: 30,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    side: BorderSide.none,
                                    shape: const BeveledRectangleBorder()),
                                child: Text(
                                  'View More',
                                  style: TextStyle(
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.w700,
                                      height: 0.0,
                                      fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  sbh(20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: greycolor,
                    )),
                    height: 200,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              PieChart(
                                PieChartData(
                                  startDegreeOffset: 126,
                                  pieTouchData: PieTouchData(
                                    enabled: false,
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 30,
                                  sections: showingSections(5, 0),
                                ),
                              ),
                              const Text(
                                '100%',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        sbw(20),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  sections,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Indicator(
                                            size: 14,
                                            color: seccolors[index],
                                            text: legends[index],
                                            fontWeight: _selectedsec == index
                                                ? FontWeight.w700
                                                : FontWeight.w600,
                                            isSquare: true),
                                      ))),
                        ),
                      ],
                    ),
                  ),
                  sbh(20),
                  Wrap(
                    clipBehavior: Clip.none,
                    spacing: 14.0,
                    runSpacing: 10.0,
                    children: iconMap.entries.map((entry) {
                      return buildpackagelist(entry.key, entry.value);
                    }).toList(),
                  ),
                  sbh(20),
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width - 65,
                          padding: const EdgeInsets.all(8.0),
                          color: const Color(0xFF0561AB),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                3,
                                (index) => TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _slctdbtn = index;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      shape: const BeveledRectangleBorder(),
                                      backgroundColor: _slctdbtn == index
                                          ? Colors.white
                                          : Colors.transparent),
                                  child: Text(
                                    btnnames[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: _slctdbtn != index
                                            ? const Color(0xFFFFFFFF)
                                            : const Color(0xFF0561AB),
                                        fontWeight: _slctdbtn == index
                                            ? FontWeight.w700
                                            : FontWeight.w500),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: double.infinity,
                          width: 25,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF48B5E4),
                                padding: EdgeInsets.zero,
                                shape: const BeveledRectangleBorder()),
                            child: const Icon(
                              Icons.navigate_next_outlined,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  sbh(20),
                  const Text(
                    'Itinerary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  sbh(10),
                  const Text(
                    'Return Flight Amsterdam - Dublin',
                    style: TextStyle(color: Colors.grey),
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: Table(
                  //     children: [TableRow(children: [])],
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 1.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        unselectedItemColor: Colors.grey,
        onTap: (x) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.search),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(CustomIcons.location), label: ''),
          BottomNavigationBarItem(icon: Icon(CustomIcons.profile), label: ''),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(int sections, int selectedsec) {
    return List.generate(sections, (i) {
      final isselected = i == selectedsec;
      setState(() {
        _selectedsec = selectedsec;
      });
      final List<double> value = [30, 10, 40, 10, 10];

      final fontSize = isselected ? 12.0 : 8.0;
      final radius = isselected ? 45.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: seccolors[i],
        value: value[i],
        showTitle: true,
        title: isselected ? "${value[i].toInt()}%" : null,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    });
  }

  Widget buildpackagelist(IconData icon, String text) {
    return SizedBox(
        height: 25,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: const Color(0xFFF7A81A),
              size:
                  icon == CustomIcons.persons || icon == CustomIcons.difficulty
                      ? 18
                      : 20,
            ),
            sbw(7),
            Text(text)
          ],
        ));
  }
}
