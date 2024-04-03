import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '/reusabs/reusabs.dart';
import 'profileedit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Divider(),
          sbh(18),
          ProfileComp.profiletile('Profile Edit', () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileEdit()));
          }),
          sbh(12),
          ProfileComp.profiletile('Experience', () {}),
          sbh(12),
          ProfileComp.profiletile('Professional Sport Activities', () {}),
          sbh(12),
          ProfileComp.profiletile('Certificate and License', () {}),
        ]),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////

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

  static DropdownButton2 dropdownbtn(List<String> items, String hint,
      String? selectedValue, void Function() setstate, Color decColor) {
    return DropdownButton2<String>(
      isExpanded: true,
      hint: const Text('Gender'),
      items: items
          .map((String item) => DropdownMenuItem<String>(
                enabled: true,
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (String? value) {
        setstate;
      },
      buttonStyleData: ButtonStyleData(
        height: 50,
        padding: const EdgeInsets.only(left: 0, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black26,
            ),
            color: decColor),
        elevation: 0,
      ),
      dropdownStyleData: const DropdownStyleData(elevation: 0),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
        padding: EdgeInsets.only(left: 14, right: 14),
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
