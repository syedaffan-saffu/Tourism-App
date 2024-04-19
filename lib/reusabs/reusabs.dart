// ignore_for_file: constant_identifier_names
import "package:flutter/material.dart";

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'CustomIcons';
  static const String? _kFontPkg = null;

  static const IconData binoculars =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData calender =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData car_icon =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData couple =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData difficulty =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData earthicon =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData home =
      IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData hotel =
      IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData location =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData luggage =
      IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData peoples =
      IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData persons =
      IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData plane_icon =
      IconData(0xe80c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData profile =
      IconData(0xe80d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pump_icon =
      IconData(0xe80e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search =
      IconData(0xe80f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData sign_icon =
      IconData(0xe810, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData takeoff =
      IconData(0xe811, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class HeartIcons {
  HeartIcons._();

  static const _kFontFam = 'HeartIcons';
  static const String? _kFontPkg = null;

  static const IconData heart_empty =
      IconData(0xe812, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heart =
      IconData(0xe813, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

///////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

class CardView extends StatelessWidget {
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
                            img,
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: iconsrow,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 12),
                    child: SizedBox(
                      child: tags,
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
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    sbh(7),
                    SizedBox(
                      child: locorating,
                    ),
                    sbh(7),
                    SizedBox(child: locs),
                    sbh(7),
                    Text(
                      description,
                      style:
                          const TextStyle(color: Color.fromARGB(132, 0, 0, 0)),
                    ),
                    sbh(15),
                    SizedBox(
                      child: btnrow,
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

