import "package:flutter/material.dart";
import "package:trekkers_pk/utils/utilspack2.dart";

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HeadingText(
        mainAxisAlignment: MainAxisAlignment.center,
        text: "Location",
      ),
    );
  }
}