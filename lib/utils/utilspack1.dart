// ignore_for_file: constant_identifier_names
import "package:flutter/material.dart";

// ignore: camel_case_types

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

class Social {
  Social._();

  static const _kFontFam = 'Social';
  static const String? _kFontPkg = null;

  static const IconData facebook =
      IconData(0xf09a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData apple =
      IconData(0xf179, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData google =
      IconData(0xf1a0, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class Planeicon {
  Planeicon._();

  static const _kFontFam = 'Planeicon';
  static const String? _kFontPkg = null;

  static const IconData tripplane2 =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class TripsnTours {
  TripsnTours._();

  static const _kFontFam = 'TripsnTours';
  static const String? _kFontPkg = null;

  static const IconData shop =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData stay =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData food =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
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
///
///
class ValidationUtils {
  static bool isEmailValid(String email) {
    // Regular expression for a simple email validation
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPassValid(String pass) {
    return pass.length > 7;
  }

  static bool isCnfPassValid(String pass, String cnfpass) {
    return cnfpass == pass && isPassValid(pass);
  }

  static bool isfieldEmpty(String field) {
    return field.isEmpty;
  }

  static bool isPhoneValid(String phone) {
    return phone.length == 11;
  }

  static bool isNameValid(String name) {
    return name.length > 2;
  }
}

//////////////////////////////////////////////
//////////////////////////////////////
class AuthUtils {
  static const String apiurl = "https://api.dev.trekkers.pk";
}

/////////////////////////////////////
///
///
//.....................
class CardView extends StatelessWidget {
  final String img;
  final String title;
  final Row? locorating;
  final String description;
  final String? price;
  final String? stay;
  final String rating;
  final Widget? tags;
  final Widget? iconsrow;
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
        width: contextwidth(context) * 0.78,
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
                    gapV(7),
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    gapV(7),
                    SizedBox(
                      child: locorating,
                    ),
                    gapV(7),
                    SizedBox(child: locs),
                    gapV(7),
                    Text(
                      description,
                      style:
                          const TextStyle(color: Color.fromARGB(132, 0, 0, 0)),
                    ),
                    gapV(15),
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

Widget gapV(double height) {
  return SizedBox(
    height: height,
  );
}

Widget gapH(double width) {
  return SizedBox(
    width: width,
  );
}

///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

double contextheight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

double contextwidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}
