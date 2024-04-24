import 'package:flutter/material.dart';

class TnTCard extends StatelessWidget {
  const TnTCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Badge(
        child: Card(
          child: Column(children: []),
        ),
      ),
    );
  }
}
