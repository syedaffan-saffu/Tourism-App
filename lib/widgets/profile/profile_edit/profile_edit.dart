import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:trekkers_pk/widgets/profile/profile_edit/prof_edit_comps.dart';
import 'package:trekkers_pk/widgets/profile/profile_edit/profile_edit_services.dart';

import '../../../utils/utilspack1.dart';
import '../profile.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final ProfileEditServices _profileService = ProfileEditServices();
  final ImagePicker _picker = ImagePicker();
  bool _valid = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
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

  String? _selectedgender;
  String? selectedlang;
  String? selectedprof;

  List<String> languages = [];
  List<String> languageLevels = [];
  String? _cachedimgfile;
  bool _isuploaded = false;

  File? _profimagefile;
  bool _newimgupload = false;
  bool _nameisempty = false;
  bool _phoneisempty = false;

  Future _imagepicker() async {
    _newimgupload = true;
    final XFile? imageraw =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profimagefile = File(imageraw!.path);
      _cachedimgfile = imageraw.path;
      _isuploaded = true;
    });
  }

  Future<void> _loadDbImg() async {
    final img = await _profileService.readPicDb();
    if (img != null) {
      _profimagefile = img;
      _cachedimgfile = img.path;
      _isuploaded = true;
    }
    null;
  }

  Future<void> _loadData() async {
    final data = await _profileService.readDb();
    setState(() {
      _name.text = data['name'] ?? '';
      _phone.text = data['phone'] ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
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
            SizedBox(
              width: contextwidth(context) * 0.75,
              child: const Text(
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
                  child: FutureBuilder(
                    future: _newimgupload ? null : _loadDbImg(),
                    builder: (context, snapshot) => CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      foregroundImage:
                          _isuploaded ? FileImage(_profimagefile!) : null,
                    ),
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
              onChanged: (value) {
                setState(() {
                  _nameisempty = false;
                });
              },
              decoration:
                  ProfileComps.profileinputdec('Full Name', _nameisempty),
              controller: _name,
            ),
            sbh(12),
            TextField(
              onChanged: (value) {
                setState(() {
                  _phoneisempty = false;
                });
              },
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration:
                  ProfileComps.profileinputdec('Phone Number', _phoneisempty),
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
                value: _selectedgender,
                onChanged: (String? value) {
                  setState(() {
                    _selectedgender = value;
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
                dropdownStyleData: const DropdownStyleData(
                  elevation: 0,
                ),
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
                        child: ProfEditComps.langTile(
                            languages, languageLevels, index, () {
                          setState(() {
                            items2.add(languages.elementAt(index));
                            languages.removeAt(index);
                            languageLevels.removeAt(index);
                          });
                        }));
                  }),
            ),
            sbh(12),
            ProfileComps.submitButton(
              text: "Next",
              onpressed: () async {
                _validation();
                _valid
                    ? {
                        await _profileService.writeDb(
                          _cachedimgfile!,
                          _name.text,
                          _phone.text,
                        ),
                        GoRouter.of(context).push("/profile/exp")
                      }
                    : null;
              },
            )
          ]),
        ),
      ),
    );
  }

  void _validation() {
    if (!_isuploaded ||
        _selectedgender == null ||
        _name.text.isEmpty ||
        _phone.text.isEmpty ||
        languages.isEmpty) {
      if (_name.text.isEmpty) {
        setState(() {
          _nameisempty = true;
        });
      }
      if (_phone.text.isEmpty) {
        setState(() {
          _phoneisempty = true;
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          'Not all fields are Selected or Filled!',
        ),
      ));
    } else {
      setState(() {
        _valid = true;
      });

      // gorouter line
    }
  }

  String concater(List<String> listofstring) {
    String concated = listofstring.join(",");
    return concated;
  }

  @override
  void dispose() {
    _profileService.closedb();
    super.dispose();
  }
}
