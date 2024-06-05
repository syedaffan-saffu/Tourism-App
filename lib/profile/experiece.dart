import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trekkers_pk/profile/profile_comps.dart';
import 'package:trekkers_pk/profile/profile_edit/edit_components.dart';
import 'package:trekkers_pk/utils/reusabs.dart';
import 'profile.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final TextEditingController _tellus = TextEditingController();
  static const List<String> _items1 = ["K-2", "Biafo", "Skardu", "Naran"];
  static const List<String> _items2 = [
    "Base Camp",
    "BaseCamp 1 6500m",
    "BaseCamp 2 7690m",
    "Camp 1 10000m"
  ];
  static const String fchoice =
      "Have you taken any part or led any expeditions?";
  bool _ischeckedyes = false;
  bool _ischeckedno = false;
  static const String ifyes =
      "Have you been or led tours to these destinations?";
  static const String hint =
      "(Please select the places and specify the exact location you have been to.)";

  static const String exp =
      "Do you have any achievements from your travels or journeys?";
  static const String ifyes2 =
      "If yes, please tell us if you have won any title, made any record, or achieved any notable accomplishments.";
  String? locates;
  String? sublocates;

  void _validateexp() {
    if (_ischeckedyes) {
      if (locates == null || sublocates == null || _tellus.text.isEmpty) {
        print(
            " $_ischeckedyes ${locates == null} ${sublocates == null}  ${_tellus.text.isEmpty}");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Not All Fiels are Valid!")));
      } else {
        GoRouter.of(context).push("/profile/sportsact");
      }
    } else if (_ischeckedno) {
      GoRouter.of(context).push("/profile/sportsact");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Not All Fiels are Valid!")));
    }
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
                fchoice,
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
                      children: [
                        const Text(
                          ifyes,
                          style: ProfileComps.heading,
                        ),
                        const Text(
                          hint,
                          style: TextStyle(
                              color: Color(0xFFA1A1A1),
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                        sbh(15),
                        DropDown(
                          title: "Locations",
                          items: _items1,
                          value: locates,
                          onpressed: (String? value) {
                            setState(() {
                              locates = value;
                            });
                          },
                        ),
                        sbh(15),
                        DropDown(
                          title: "Sublocations",
                          items: _items2,
                          value: sublocates,
                          onpressed: (String? value) {
                            setState(() {
                              sublocates = value;
                            });
                          },
                        ),
                      ],
                    )
                  : const SizedBox(),
              sbh(20),
              const Text(
                exp,
                style: ProfileComps.heading,
              ),
              Text(
                ifyes2,
                style: ProfileComps.hintstyle
                    .copyWith(fontStyle: FontStyle.normal),
              ),
              sbh(20),
              TextField(
                controller: _tellus,
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
}
