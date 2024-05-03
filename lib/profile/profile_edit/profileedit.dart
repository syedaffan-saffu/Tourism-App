import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trekkers_pk/profile/experiece.dart';
import 'package:trekkers_pk/profile/profile_edit/edit_components.dart';

import '../../reusabs/reusabs.dart';
import '../profile.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  final List<String> items1 = [
    'Male',
    'Female',
  ];
  List<String> items2 = [
    'Urdu',
    'English',
    'Pashto',
    'Sindhi',
  ];
  static final List<String> items3 = ['beginner', 'Intermediate', 'Native'];

  List<String> selectedLanguages = [];

  String? selectedgender;
  String? selectedlang;
  String? selectedprof;

  List<String> languages = [];
  List<String> languageLevels = [];

  // GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  bool _isuploaded = false;
  final ImagePicker picker = ImagePicker();
  File? profimagefile;

  Future _imagepicker() async {
    final XFile? imageraw = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profimagefile = File(imageraw!.path);
      _isuploaded = true;
    });
  }

  void _validation() {
    if (!_isuploaded ||
        selectedgender == null ||
        selectedlang == null ||
        selectedprof == null ||
        name.text.isEmpty ||
        phone.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Not all fields are filled!'),
      ));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Experience()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProfileComps.appBar('Profile Edit'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              width: 300,
              child: Text(
                'Let’s start with adding your personal details and a profile picture.',
                style: ProfileComps.heading,
              ),
            ),
            const Text(
              'You can also edit these details later.',
              style: ProfileComps.heading,
            ),
            sbh(18),
            Row(
              children: [
                InkWell(
                  onTap: _imagepicker,
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
            TextField(
              decoration: ProfileComps.profileinputdec('Full Name'),
              controller: name,
            ),
            sbh(12),
            TextField(
              decoration: ProfileComps.profileinputdec('Phone Number'),
              controller: phone,
              keyboardType: TextInputType.phone,
            ),
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
                value: selectedgender,
                onChanged: (String? value) {
                  setState(() {
                    selectedgender = value;
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropDown(
                        title: 'Language',
                        items: items2,
                        value: selectedlang,
                        onpressed: (String? value) {
                          setState(() {
                            selectedlang = value;
                          });
                        }),
                    DropDown(
                        title: 'Language Level',
                        items: items3,
                        value: selectedprof,
                        onpressed: (String? value) {
                          setState(() {
                            selectedprof = value;
                          });
                        }),
                    ProfileComps.submitButton(
                        sub: true,
                        text: "Add",
                        onpressed: () {
                          if (selectedlang != null && selectedprof != null) {
                            setState(() {
                              languages.add(selectedlang!);
                              languageLevels.add(selectedprof!);
                              items2.remove(selectedlang);
                              selectedlang = null;
                              selectedprof = null;
                            });
                          }
                        },
                        color: const Color(0xFF0561AB))
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
                        child: EditComps.langTile(
                            languages, languageLevels, index, () {
                          setState(() {
                            languages.removeAt(index);
                            languageLevels.removeAt(index);
                          });
                        }));
                  }),
            ),
            sbh(12),
            ProfileComps.submitButton(
              text: "Next",
              onpressed: _validation,
            )
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
