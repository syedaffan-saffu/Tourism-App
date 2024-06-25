import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/backend/router/routes.dart';
import 'package:trekkers_pk/backend/sharedprefs/sharedprefs.dart';
import 'package:trekkers_pk/widgets/profile/profile_edit/profile_edit_services.dart';
import '../../backend/provider/providers.dart';
import '../../utils/utilspack1.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static SharedPrefsStoreString sharedPrefsStoreString =
      SharedPrefsStoreString();
  static ProfileEditServices profileEditServices = ProfileEditServices();

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context, listen: false);
    final indexProv = Provider.of<IndexProvider>(context, listen: false);
    return Scaffold(
      appBar: ProfileComps.appBar("Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProfileComps.profiletile('Profile Edit', () {
            GoRouter.of(context).go("/profile/profedit");
          }),
          sbh(12),
          ProfileComps.profiletile('Experience', () {
            GoRouter.of(context).go("/profile/exp");
          }),
          sbh(12),
          ProfileComps.profiletile('Professional Sport Activities', () {
            GoRouter.of(context).go("/profile/sportsact");
          }),
          sbh(12),
          ProfileComps.profiletile('Certificate and License', () {
            GoRouter.of(context).go("/profile/certnlic");
          }),
          sbh(12),
          ProfileComps.profiletile('Logout', () async {
            authProv.logout();

            sectionANavigatorKey.currentState!
                .popUntil((route) => route.settings.name == "/home");
            if (sectionBNavigatorKey.currentState != null) {
              sectionBNavigatorKey.currentState!
                  .popUntil((route) => route.settings.name == "/search");
            }
            if (sectionCNavigatorKey.currentState != null) {
              sectionCNavigatorKey.currentState!
                  .popUntil((route) => route.settings.name == "/location");
            }
            profileEditServices.deleteDb(context);
            sharedPrefsStoreString.deletetext();
            if (context.mounted) {
              GoRouter.of(context).go("/home");
            }
            authProv.logout();
            indexProv.changeindex(0);
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
