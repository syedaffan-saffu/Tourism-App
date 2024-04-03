import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../reusabs/reusabs.dart';
import 'profile.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final List<String> items1 = [
    'Male',
    'Female',
  ];
  final List<String> items2 = [
    'Urdu',
    'English',
    'Pashto',
    'Sindhi',
  ];
  final List<String> items3 = ['beginner', 'Intermediate', 'Native'];

  String? selectedValue1;
  String? selectedlang;
  String? selectedprof;

  List<String> languages = [];
  List<String> languageLevels = [];

  // GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  bool _isuploaded = false;
  final ImagePicker picker = ImagePicker();
  File? profimagefile;

  Future imagepicker() async {
    final XFile? imageraw = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profimagefile = File(imageraw!.path);
      _isuploaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Profile Edit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                    height: 35,
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
            const Divider(),
            sbh(15),
            const SizedBox(
              width: 300,
              child: Text(
                'Let’s start with adding your personal details and a profile picture.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Text(
              'You can also edit these details later.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            sbh(18),
            Row(
              children: [
                InkWell(
                  onTap: imagepicker,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    foregroundImage:
                        _isuploaded ? FileImage(profimagefile!) : null,
                  ),
                ),
                sbw(20),
                const Text(
                  'Profile Image Here',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
            sbh(20),
            TextField(decoration: ProfileComp.profileinputdec('Full Name')),
            sbh(12),
            TextField(decoration: ProfileComp.profileinputdec('Phone Number')),
            sbh(12),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: const Text('Gender'),
                items: items1
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
                value: selectedValue1,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue1 = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: const EdgeInsets.only(left: 0, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 212, 212, 212),
                      ),
                      color: Colors.grey[100]),
                  elevation: 0,
                ),
                dropdownStyleData: const DropdownStyleData(elevation: 0),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
            sbh(12),
            Container(
              height: 180,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Column(children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Text('Language'),
                    items: items2
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
                    value: selectedlang,
                    onChanged: (String? value) {
                      setState(() {
                        selectedlang = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color.fromARGB(255, 212, 212, 212),
                          ),
                          color: Colors.white70),
                      elevation: 0,
                    ),
                    dropdownStyleData:
                        const DropdownStyleData(elevation: 0, width: 150),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 30,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
                sbh(12),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Text('Language Level'),
                    items: items3
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
                    value: selectedprof,
                    onChanged: (String? value) {
                      setState(() {
                        selectedprof = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color.fromARGB(255, 212, 212, 212),
                          ),
                          color: Colors.white70),
                      elevation: 0,
                    ),
                    dropdownStyleData:
                        const DropdownStyleData(elevation: 0, width: 150),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 30,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
                sbh(10),
                ElevatedButton(
                  onPressed: () {
                    if (selectedlang != null && selectedprof != null) {
                      setState(() {
                        languages.add(selectedlang!);
                        languageLevels.add(selectedprof!);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      fixedSize: const Size.fromWidth(double.maxFinite),
                      backgroundColor: const Color.fromARGB(255, 13, 74, 164)),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 16,
                        height: 3.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ]),
            ),
            sbh(10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 0.0),
                          foregroundColor:
                              const Color.fromARGB(213, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 155, 212, 247)),
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor:
                              const Color.fromARGB(111, 189, 233, 255),
                        ),
                        onPressed: () {
                          setState(() {
                            languages.removeAt(index);
                            languageLevels.removeAt(index);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4.0, top: 5.0, bottom: 5.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    languages[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.black,
                                      height: 0.0,
                                    ),
                                  ),
                                  Text(
                                    languageLevels[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        height: 0.0),
                                  ),
                                ],
                              ),
                              sbw(5),
                              SizedBox(
                                  height: 25,
                                  child:
                                      Image.asset('assets/icons/crossicon.png'))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            sbh(12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  fixedSize: const Size.fromWidth(double.maxFinite),
                  backgroundColor: const Color.fromARGB(255, 43, 181, 255)),
              child: const Text(
                'Next',
                style: TextStyle(
                    height: 3.0,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
