import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trekkers_pk/src/profile/profile.dart';
import 'package:trekkers_pk/src/profile/profile_edit/edit_components.dart';
import 'package:trekkers_pk/utils/reusabs.dart';

import 'profile_comps.dart';

class SportsAct extends StatefulWidget {
  const SportsAct({super.key});

  @override
  State<SportsAct> createState() => _SportsActState();
}

class _SportsActState extends State<SportsAct> {
  TextEditingController _datefieldcont = TextEditingController(text: "Year");
  List<String> institutes =
      List.generate(7, (index) => "Dummy Institute $index");
  static const String plzselect =
      "Please select the professional sports activities that you are good at. These activities will display in your profile and help you shine with your true calling.";
  static const String skillrate =
      "How would you rate your mountaineering skill?";
  List<String> exercises = [
    'Mountaineering',
    'Trekking',
    'Hiking',
    'Technical Climbing',
    'Skiing',
    'Paragliding',
    'Canyoning',
    'Skydiving',
    'Snowboarding',
    'Mountain biking'
  ];
  static final List<String> items2 = [
    'beginner',
    'Intermediate',
    'Professional'
  ];
  static const String ifyes =
      "If yes, please share where you have given training before.";

  bool ischecked1 = false;
  bool ischecked2 = false;
  static const String when =
      "When did you first start pursuing mountaineering?";
  static const String hint1 = "(Select the options from the list provided).";

  String? selectedValue2;
  String? selectedValue3;
  Set<String> selectedExercises = {};
  DateTime? _selecteddate;
  static const String haveyou =
      "Have you completed any course or got trained by any of these institutes?";
  static const String ifnamenot =
      "If the name of the institute is not in the options, write it below";
  static const String isexpert = "Are you expert enough to train others?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileComps.appBar("Professional Sports Activities"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                plzselect,
                style: ProfileComps.heading,
              ),
              sbh(20),
              Wrap(
                runSpacing: 5.0,
                spacing: 5.0,
                children: exercises.map((exercise) {
                  bool isSelected = selectedExercises.contains(exercise);
                  return FilterChip(
                    selectedColor: const Color(0xFFEDFAFF),
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(
                        color: isSelected
                            ? const Color(0xFFACE6FF)
                            : const Color(0xFFEAEAEA)),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          exercise,
                          style: ProfileComps.heading,
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: isSelected
                              ? const Color(0xFFAFE7FF)
                              : const Color(0xFFE1E1E1),
                          child: Icon(
                            isSelected ? Icons.close : Icons.add,
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedExercises.add(exercise);
                        } else {
                          selectedExercises.remove(exercise);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              sbh(20),
              const Text(
                skillrate,
                style: ProfileComps.heading,
              ),
              sbh(15),
              DropDown(
                title: "Level",
                items: items2,
                value: selectedValue2,
                onpressed: (String? value) {
                  setState(() {
                    selectedValue2 = value;
                  });
                },
              ),
              sbh(15),
              const Text(
                when,
                style: ProfileComps.heading,
              ),
              TextField(
                controller: _datefieldcont,
                decoration: ProfileComps.profileinputdec('...', false),
                onTap: () async {
                  _selecteddate = await showDatePicker(
                      initialDatePickerMode: DatePickerMode.year,
                      context: context,
                      firstDate: DateTime(1980),
                      lastDate: DateTime.now());
                  setState(() {
                    _datefieldcont.text = _selecteddate!.year.toString();
                  });
                },
              ),
              // SizedBox(
              //   height: 200,
              //   child: YearPicker(
              //       firstDate: DateTime(1988),
              //       lastDate: DateTime.now(),
              //       selectedDate: _selecteddate,
              //       onChanged: (datetime) {
              //         Future.delayed(Duration.zero, () {
              //           setState(() {
              //             _selecteddate = datetime;
              //           });
              //         });
              //       }),
              // ),
              sbh(20),
              const Text(
                haveyou,
                style: ProfileComps.heading,
              ),
              const Text(
                hint1,
                style: ProfileComps.hintstyle,
              ),
              sbh(15),
              DropDown(
                title: "Institute",
                items: institutes,
                value: selectedValue3,
                onpressed: (String? value) {
                  setState(() {
                    selectedValue3 = value;
                  });
                },
              ),
              sbh(15),
              TextField(
                  decoration:
                      ProfileComps.profileinputdec('Course Name', false)),
              sbh(15),
              Text(
                ifnamenot,
                style: ProfileComps.hintstyle.copyWith(fontSize: 14),
              ),
              sbh(15),
              SizedBox(
                width: contextwidth(context) * 0.75,
                child: TextField(
                    decoration: ProfileComps.profileinputdec('Other', false)),
              ),
              sbh(15),
              SizedBox(
                width: contextwidth(context) * 0.75,
                child: TextField(
                    decoration:
                        ProfileComps.profileinputdec('Training Name', false)),
              ),
              sbh(15),
              const Text(
                isexpert,
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
              sbh(10),
              TextField(decoration: ProfileComps.profileinputdec('...', false)),
              sbh(25),
              ProfileComps.submitButton(
                  text: "Next",
                  onpressed: () {
                    GoRouter.of(context).push("/profile/certnlic");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
