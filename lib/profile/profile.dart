import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
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
          ProfileComps.profiletile('Experience', () {}),
          sbh(12),
          ProfileComps.profiletile('Professional Sport Activities', () {}),
          sbh(12),
          ProfileComps.profiletile('Certificate and License', () {}),
        ]),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////

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

  static InputDecoration profileinputdec(String hint) {
    return InputDecoration(
      fillColor: const Color.fromARGB(255, 247, 247, 247),
      filled: true,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      hintText: hint,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 203, 203, 203))),
    );
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

  // Container(
  //   decoration: const BoxDecoration(
  //     color: Colors.white,
  //     shape: BoxShape.circle,
  //   ),
  //   height: 100,
  //   width: 100,
  //   padding: const EdgeInsets.all(3.0),
  //   child: ClipOval(
  //     child: InkWell(
  //       onTap: () {
  //         imagepicker();
  //       },
  //       child: isuploaded
  //           ? Image.file(
  //               profimagefile!,
  //               fit: BoxFit.fill,
  //             )
  //           : Container(
  //               decoration:
  //                   const BoxDecoration(color: Colors.grey),
  //             ),
  //     ),
  //   ),
  // ),

//////////////////////////////////////////////////////////////////////////////////////

  // const DropdownMenu(

  //     inputDecorationTheme: InputDecorationTheme(
  //         enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: Colors.grey)),
  //         isDense: true,
  //         constraints: BoxConstraints(maxHeight: 50)),
  //     width: 360,
  //     hintText: 'Gender',
  //     dropdownMenuEntries: [
  //       DropdownMenuEntry(value: 1, label: 'Male'),
  //       DropdownMenuEntry(value: 2, label: 'Female')
  //     ]),
}
