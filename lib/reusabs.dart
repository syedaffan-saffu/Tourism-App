// ignore_for_file: constant_identifier_names

import "package:flutter/material.dart";
import "package:percent_indicator/linear_percent_indicator.dart";

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'CustomIcons';
  static const String? _kFontPkg = null;

  static const IconData calender =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData car_icon =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData earthicon =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData profile =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData plane_icon =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData home =
      IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pump_icon =
      IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData sign_icon =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData location =
      IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

///////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

class CardView extends StatefulWidget {
  final String img;
  final String title;
  final Row? locorating;
  final String description;
  final String? price;
  final String? stay;
  final String rating;
  final Widget? tags;
  final Row? iconsrow;
  final Widget? locs;
  final Row? btnrow;

  const CardView({
    super.key,
    required this.img,
    required this.title,
    this.locorating,
    required this.description,
    this.price,
    required this.rating,
    this.stay,
    this.tags,
    this.iconsrow,
    this.locs,
    this.btnrow,
  });

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
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
              Center(
                child: Stack(alignment: Alignment.topRight, children: [
                  Column(
                    children: [
                      SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            widget.img,
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: widget.iconsrow,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 12),
                    child: SizedBox(
                      child: widget.tags,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ]),
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
                      widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    sbh(7),
                    SizedBox(
                      child: widget.locorating,
                    ),
                    sbh(7),
                    SizedBox(child: widget.locs),
                    sbh(7),
                    Text(
                      widget.description,
                      style:
                          const TextStyle(color: Color.fromARGB(132, 0, 0, 0)),
                    ),
                    sbh(15),
                    SizedBox(
                      child: widget.btnrow,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

Card avatarcard(
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
    child: InkWell(
      hoverColor: Colors.white70,
      onTap: () {},
      child: SizedBox(
        width: 350,
        child: Column(

            // mainAxisSize: MainAxisSize.min,
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
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('ratings Star'),
                                      Text('/4')
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  since,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  nexttrip,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ]),
                          ///////////////////////////////////////////////////////////////////////////////////////////
                          const Divider(),
                          Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Experience',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                    child: ClipOval(
                      child: Image.asset(
                        avatarimg,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
      ),
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

Widget sbh(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sbw(double width) {
  return SizedBox(
    width: width,
  );
}

///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

class ProfileComp {
  static ListTile profiletile(String title, void Function() ontap) {
    return ListTile(
      onTap: ontap,
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 15.0,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
      contentPadding: const EdgeInsets.only(right: 5.0),
      trailing: const Icon(Icons.navigate_next),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          side: BorderSide(color: Color.fromARGB(255, 203, 203, 203))),
    );
  }
}
