import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trekkers_pk/backend/sharedprefs/sharedprefs.dart';
import 'package:trekkers_pk/utils/utilspack2.dart';
import 'package:trekkers_pk/widgets/profile/profile_comps.dart';
import 'package:trekkers_pk/widgets/profile/profile_edit/prof_edit_comps.dart';
import 'package:trekkers_pk/utils/utilspack1.dart';
import 'profile.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  SharedPrefsStoreString sharedPrefsStoreString = SharedPrefsStoreString();
  final TextEditingController _tellusfield = TextEditingController();
  static const List<String> _items1 = ["K-2", "Biafo", "Skardu", "Naran"];
  static const List<String> _items2 = [
    "Base Camp",
    "BaseCamp 1 6500m",
    "BaseCamp 2 7690m",
    "Camp 1 10000m"
  ];
  static const String _choicetext =
      "Have you taken any part or led any expeditions?";
  bool _ischeckedyes = false;
  bool _ischeckedno = false;
  static const String _ifyestext =
      "Have you been or led tours to these destinations?";
  static const String _hint =
      "(Please select the places and specify the exact location you have been to.)";

  static const String _anyexptext =
      "Do you have any achievements from your travels or journeys?";
  static const String _ifyestext2 =
      "If yes, please tell us if you have won any title, made any record, or achieved any notable accomplishments.";
  String? _locats;
  String? _sublocats;
/////////////////////////////////////////////////////////////////////////
  Future<void> _setText() async {
    final gottext = await sharedPrefsStoreString.gettext("expfield");
    _tellusfield.text = gottext;
    if (gottext != "") {
      setState(() {
        _ischeckedyes = true;
      });
      debugPrint("$_ischeckedyes");
    }
  }

  Future<void> _storeText() async {
    await sharedPrefsStoreString.storetext("expfield", _tellusfield.text);
  }

/////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileComps.appBar('Experience'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                _choicetext,
                style: ProfileComps.heading,
              ),
              SizedBox(
                width: contextwidth(context) * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckBox(
                        ischecked: _ischeckedyes,
                        onpressed: (nvalue) {
                          setState(() {
                            _ischeckedyes = nvalue!;
                            _ischeckedno = false;
                          });
                        }),
                    const Text("Yes"),
                    CheckBox(
                        ischecked: _ischeckedno,
                        onpressed: (nvalue) {
                          setState(() {
                            _ischeckedno = nvalue!;
                            _ischeckedyes = false;
                          });
                        }),
                    const Text("No"),
                  ],
                ),
              ),
              _ischeckedyes
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          _ifyestext,
                          style: ProfileComps.heading,
                        ),
                        const Text(
                          _hint,
                          style: TextStyle(
                              color: Color(0xFFA1A1A1),
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                        sbh(15),
                        DropDown(
                          title: "Locations",
                          items: _items1,
                          value: _locats,
                          onpressed: (String? value) {
                            setState(() {
                              _locats = value;
                            });
                          },
                        ),
                        sbh(15),
                        DropDown(
                          title: "Sublocations",
                          items: _items2,
                          value: _sublocats,
                          onpressed: (String? value) {
                            setState(() {
                              _sublocats = value;
                            });
                          },
                        ),
                      ],
                    )
                  : const SizedBox(),
              sbh(20),
              const Text(
                _anyexptext,
                style: ProfileComps.heading,
              ),
              Text(
                _ifyestext2,
                style: ProfileComps.hintstyle
                    .copyWith(fontStyle: FontStyle.normal),
              ),
              sbh(20),
              TextField(
                controller: _tellusfield,
                enabled: _ischeckedyes,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF1F1F1),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC6C6C6)))),
                minLines: 5,
                maxLines: 5,
              ),
              sbh(10),
              ProfileComps.submitButton(
                text: "Next",
                onpressed: _validateexp,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _validateexp() async {
    if (_ischeckedyes) {
      if (_locats == null || _sublocats == null || _tellusfield.text.isEmpty) {
        debugPrint(
            " $_ischeckedyes ${_locats == null} ${_sublocats == null}  ${_tellusfield.text.isEmpty}");
        ScaffoldMessenger.of(context)
            .showSnackBar(UtilsPack2.snackBar("Not All Fields are Valid", 2));
      } else {
        await _storeText();
        GoRouter.of(context).push("/profile/sportsact");
      }
    } else if (_ischeckedno) {
      GoRouter.of(context).push("/profile/sportsact");
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(UtilsPack2.snackBar("Not All Fields are Valid", 2));
    }
  }
}
