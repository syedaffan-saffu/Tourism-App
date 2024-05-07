import 'package:flutter/material.dart';
import 'package:trekkers_pk/profile/cert_license.dart';
import 'package:trekkers_pk/profile/experiece.dart';
import 'package:trekkers_pk/profile/p_s_activities.dart';
import '/reusabs/reusabs.dart';
import 'profile_edit/profileedit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileComps.appBar("Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProfileComps.profiletile('Profile Edit', () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileEdit()));
          }),
          sbh(12),
          ProfileComps.profiletile('Experience', () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Experience()));
          }),
          sbh(12),
          ProfileComps.profiletile('Professional Sport Activities', () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SportsAct()));
          }),
          sbh(12),
          ProfileComps.profiletile('Certificate and License', () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CertandLicense()));
          }),
        ]),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
///
///
///
///

class ProfileComps {
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

  static InputDecoration profileinputdec(String hint, bool isempty) {
    return InputDecoration(
      fillColor: const Color.fromARGB(255, 247, 247, 247),
      filled: true,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      hintText: hint,
      errorText: isempty ? "Field is Empty" : null,
      // error: isempty ? const Text("Field is Empty") : const SizedBox(),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 203, 203, 203))),
      errorBorder: isempty ? errorborder() : enabledborder(),
      focusedErrorBorder: isempty ? errorborder() : enabledborder(),
    );
  }

  static InputBorder enabledborder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 203, 203, 203)));
  }

  static InputBorder errorborder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFF0000)));
  }

  static AppBar appBar(String title) {
    return AppBar(
      shadowColor: Colors.black,
      elevation: 0.5,
      titleSpacing: 10,
      actions: null,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
              height: 35,
              width: 35,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero,
                    elevation: 0.0),
                child: Image.asset(
                  'assets/icons/nexticon.png',
                  fit: BoxFit.fill,
                ),
              ))
        ],
      ),
    );
  }

  static const TextStyle heading =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  static const TextStyle hintstyle = TextStyle(
      color: Color(0xFFA1A1A1), fontSize: 12, fontStyle: FontStyle.italic);

  static ElevatedButton submitButton(
      {required String text,
      Color? color,
      required void Function() onpressed,
      bool sub = false}) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          fixedSize: const Size.fromWidth(double.maxFinite),
          backgroundColor: color ?? const Color(0xFF36A9E1)),
      child: Text(
        text,
        style: TextStyle(
            height: 3.0,
            fontSize: sub ? 16 : 17,
            color: Colors.white,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
