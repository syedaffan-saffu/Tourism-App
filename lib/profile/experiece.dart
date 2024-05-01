import 'package:flutter/material.dart';
import 'package:trekkers_pk/profile/p_s_activities.dart';
import 'package:trekkers_pk/profile/profile_comps.dart';
import 'package:trekkers_pk/profile/profile_edit/edit_components.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';
import 'profile.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  static const List<String> items1 = ["K-2", "Biafo", "Skardu", "Naran"];
  static const List<String> items2 = [
    "Base Camp",
    "BaseCamp 1 6500m",
    "BaseCamp 2 7690m",
    "Camp 1 10000m"
  ];
  static const String fchoice =
      "Have you taken any part or led any expeditions?";
  bool ischecked1 = false;
  bool ischecked2 = false;
  static const String ifyes =
      "If yes, have you been or led tours to these destinations?";
  static const String hint =
      "(Please select the places and specify the exact location you have been to.)";

  static const String exp =
      "Do you have any achievements from your travels or journeys?";
  static const String ifyes2 =
      "If yes, please tell us if you have won any title, made any record, or achieved any notable accomplishments.";
  String? selectedValue1;
  String? selectedValue2;
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
                        ischecked: ischecked1,
                        onpressed: (nvalue) {
                          setState(() {
                            ischecked1 = nvalue!;
                            ischecked2 = false;
                          });
                        }),
                    const Text("Yes"),
                    CheckBox(
                        ischecked: ischecked2,
                        onpressed: (nvalue) {
                          setState(() {
                            ischecked2 = nvalue!;
                            ischecked1 = false;
                          });
                        }),
                    const Text("No"),
                  ],
                ),
              ),
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
                items: items1,
                value: selectedValue1,
                onpressed: (String? value) {
                  setState(() {
                    selectedValue1 = value;
                  });
                },
              ),
              sbh(15),
              DropDown(
                title: "Sublocations",
                items: items2,
                value: selectedValue2,
                onpressed: (String? value) {
                  setState(() {
                    selectedValue2 = value;
                  });
                },
              ),
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
              const TextField(
                decoration: InputDecoration(
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
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SportsAct()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
