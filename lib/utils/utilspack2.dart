import 'package:flutter/material.dart';

class UtilsPack2 {
  static SnackBar snackBar(String title, int duration) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.info,
            color: Color(0xFFF6AA21),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(title),
        ],
      ),
      duration: Duration(seconds: duration),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      backgroundColor: const Color(0xFF0561AB),
    );
  }

  static List<Text> headingTextRow(String text) {
    List<Text> texts = [];
    text = text.toUpperCase();
    text.split(" ").forEach((word) {
      if (word.isNotEmpty) {
        texts.add(Text(
          word[0], // First letter
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: "Signika",
              height: -0.1),
        ));
        if (word.length > 1) {
          texts.add(Text(
            word.substring(1), // Remaining part of the word
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                fontFamily: "Signika"),
          ));
        }
        texts.add(const Text(' ')); // Space between words
      }
    });
    // }
    return texts;
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText(
      {super.key, required this.text, required this.mainAxisAlignment});
  final String text;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: UtilsPack2.headingTextRow(text),
    );
  }
}
