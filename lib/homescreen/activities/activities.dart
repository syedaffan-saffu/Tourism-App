import 'package:flutter/material.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

class Tag extends StatefulWidget {
  const Tag({super.key});

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool _favourite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _favourite
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFFFF0000),
              width: 2,
            )),
        height: 40,
        child: IconButton(
          iconSize: 20,
          enableFeedback: false,
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(padding: EdgeInsets.zero),
          icon: _favourite
              ? const Icon(
                  HeartIcons.heart_empty,
                  color: Color(0xFFFFFFFF),
                )
              : const Icon(
                  HeartIcons.heart,
                  color: Color(0xFFFF0000),
                ),
          onPressed: () {
            setState(() {
              _favourite = !_favourite;
            });
          },
        ));
  }
}
