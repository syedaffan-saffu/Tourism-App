import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:trekkers_pk/profile/p_s_activities.dart';
import 'package:trekkers_pk/profile/profile_comps.dart';
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
  TextStyle heading =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle hintstyle = const TextStyle(
      color: Color(0xFFA1A1A1), fontSize: 12, fontStyle: FontStyle.italic);
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
              Text(
                fchoice,
                style: heading,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.3,
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
              Text(
                ifyes,
                style: heading,
              ),
              const Text(
                hint,
                style: TextStyle(
                    color: Color(0xFFA1A1A1),
                    fontSize: 12,
                    fontStyle: FontStyle.italic),
              ),
              sbh(15),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text('Locations'),
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
              sbh(15),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text('Sublocations'),
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
                  value: selectedValue2,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue2 = value;
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
              sbh(20),
              Text(
                exp,
                style: heading,
              ),
              Text(
                ifyes2,
                style: hintstyle.copyWith(fontStyle: FontStyle.normal),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SportsAct()));
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
