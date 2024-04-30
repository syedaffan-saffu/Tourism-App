import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:trekkers_pk/profile/profile.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

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
  TextStyle heading =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
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
  TextStyle hintstyle = const TextStyle(
      color: Color(0xFFA1A1A1), fontSize: 12, fontStyle: FontStyle.italic);
  String? selectedValue2;
  String? selectedValue3;
  Set<String> selectedExercises = {};
  DateTime? _selecteddate;
  static const String haveyou =
      "Have you completed any course or got trained by any of these institutes?";
  static const String ifnamenot =
      "If the name of the institute is not in the options, write it below";
  static const String isexpert = "Are you expert enough to train others?";

  Size contextsize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

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
              Text(
                plzselect,
                style: heading,
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
                          style: heading,
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
              Text(
                skillrate,
                style: heading,
              ),
              sbh(15),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text('Level'),
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
              sbh(15),
              Text(
                when,
                style: heading,
              ),
              TextField(
                controller: _datefieldcont,
                decoration: ProfileComps.profileinputdec('...'),
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
              Text(
                haveyou,
                style: heading,
              ),
              Text(
                hint1,
                style: hintstyle,
              ),
              sbh(15),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text('Institute'),
                  items: institutes
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
                  value: selectedValue3,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue3 = value;
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
              TextField(
                  decoration: ProfileComps.profileinputdec('Course Name')),
              sbh(15),
              Text(
                ifnamenot,
                style: hintstyle.copyWith(fontSize: 14),
              ),
              sbh(15),
              SizedBox(
                width: contextsize(context).width * 0.75,
                child: TextField(
                    decoration: ProfileComps.profileinputdec('Other')),
              ),
              sbh(15),
              SizedBox(
                width: contextsize(context).width * 0.75,
                child: TextField(
                    decoration: ProfileComps.profileinputdec('Training Name')),
              ),
              sbh(15),
              Text(
                isexpert,
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
              sbh(10),
              TextField(decoration: ProfileComps.profileinputdec('...')),
              sbh(25),
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
            ],
          ),
        ),
      ),
    );
  }
}
