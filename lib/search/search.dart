import 'package:flutter/material.dart';
import 'package:trekkers_pk/main.dart';
import 'package:trekkers_pk/profile/signinout/login.dart';
import 'package:trekkers_pk/search/s_tours/tours.dart';
import '/reusabs/reusabs.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  final bool isregistered;
  const Search({super.key, required this.isregistered});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DateTimeRange? _dateTime;
  static final DateFormat _dateFormat = DateFormat('dd-MM-yy');
  TextEditingController locController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final FocusNode datefocusNode = FocusNode();
  static DateTime _startdate = DateTime.now().add(const Duration(days: 9));
  DateTime _enddate = _startdate.add(const Duration(days: 7));
  static final List<String> suggestions = [
    'Hindu Kush Range',
    'Himalayas',
    'Baltoro Glacier',
    'Gondogoro La Trek',
    'K2 Base Camp',
    'Trekking',
    'Mountaineering',
    'Skiing and Snowboarding',
    'Rock Climbing',
    'Ice Climbing'
  ];
  List<Color> buttonColors =
      List.filled(suggestions.length, const Color.fromARGB(255, 231, 241, 246));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Search',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Divider(),
          sbh(18),
          TextField(
            controller: locController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Icon(CustomIcons.earthicon),
                ),
                hintText: 'What kind of Trip you are looking for?'),
          ),
          sbh(12),
          TextField(
            onTap: () async {
              _dateTime = await showDateRangePicker(
                  cancelText: 'cancel',
                  context: context,
                  initialDateRange:
                      DateTimeRange(start: _startdate, end: _enddate),
                  firstDate: _startdate,
                  lastDate: DateTime(2025));
              setState(() {
                if (_dateTime != null) {
                  _startdate = _dateTime!.start;
                  _enddate = _dateTime!.end;

                  dateController.text =
                      '${_dateFormat.format(_startdate)}  to  ${_dateFormat.format(_enddate)}';
                } else {
                  dateController.text = '';
                }
                datefocusNode.unfocus();
              });
            },
            focusNode: datefocusNode,
            controller: dateController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Icon(CustomIcons.calender),
                ),
                hintText: 'When do you want to go?'),
          ),
          sbh(20),
          Wrap(
            clipBehavior: Clip.none,
            spacing: 10.0,
            runSpacing: 10.0,
            children: suggestions.map((suggestion) {
              return buildSuggestionButton(
                  suggestion, suggestions.indexOf(suggestion));
            }).toList(),
          ),
          sbh(15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.isregistered
                    ? Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Tours()))
                    : mynavigatorKey.currentState!.push(
                        MaterialPageRoute(builder: (context) => const Login()));
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0.0),
                  backgroundColor: const Color.fromARGB(255, 255, 171, 4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: const Text(
                'Show Holidays',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 3.0,
                    fontSize: 17),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildSuggestionButton(String suggestion, int index) {
    return SizedBox(
      height: 30,
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            foregroundColor: const Color.fromARGB(213, 255, 255, 255),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: buttonColors[index]),
        onPressed: () {
          setState(() {
            locController.text = suggestion;
            _enddate = _startdate.add(const Duration(days: 7));
            dateController.text =
                "${_dateFormat.format(_startdate)} to ${_dateFormat.format(_enddate)}";
            buttonColors = List.filled(
                suggestions.length, const Color.fromARGB(255, 231, 241, 246));
            buttonColors[index] = const Color.fromARGB(255, 106, 205, 255);
          });
        },
        child: Text(
          suggestion,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
