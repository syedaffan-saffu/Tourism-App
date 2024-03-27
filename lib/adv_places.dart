import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trekkers_pk/reusabs.dart';

class Advplace extends StatefulWidget {
  const Advplace({super.key});

  @override
  State<Advplace> createState() => _AdvplaceState();
}

class _AdvplaceState extends State<Advplace> {
  Color greycolor = const Color.fromARGB(255, 209, 209, 209);
  List<String> hlts = [
    'Climb the Diamond Hill',
    'Hike at Cliffs of Moher',
    'Sightseeing Ring of Kerry',
    'Visit Cahir Castle',
    'Atmospheric Dublin and Galway'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
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
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: greycolor,
                  )),
                  height: 236,
                  child: Column(children: [
                    Container(
                      width: double.maxFinite,
                      color: Colors.blue[800],
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Highlights',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
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
                                    fontWeight: FontWeight.w600,
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
                Row(
                  children: [
                    SizedBox(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            enabled: false,
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == 0;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.grey,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
