import "package:flutter/material.dart";
import "package:trekkers_pk/utils/utilspack2.dart";

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HeadingText(
        mainAxisAlignment: MainAxisAlignment.center,
        text: "Booking Page",
      ),
    );
  }
}
