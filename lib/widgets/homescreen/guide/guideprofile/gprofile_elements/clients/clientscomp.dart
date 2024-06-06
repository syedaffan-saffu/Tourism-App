import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../utils/reusabs.dart';
import 'clientsrev.dart';

class ClientsReview extends StatelessWidget {
  const ClientsReview({super.key});

  static TextStyle heading = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Signika");
  static TextStyle bodystyle = const TextStyle(
      color: Color(0xFF5D6366), fontSize: 18, fontWeight: FontWeight.w600);
  static const String name = "Anna Diskens";
  static const String email = "anna.diskens32@gmail.com";
  static const String review =
      "For someone who had never done a group tour before, it worked out very well! If you love nature, good food and a bit of culture, Ireland is highly recommended!";
  static final DateTime _dateTime = DateTime.now();
  static String date = _dateTime.toString();
  static const double rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const BeveledRectangleBorder(
          side: BorderSide(color: Color(0xFFE2E2E2), width: 1),
          borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    scale: 6,
                  ),
                ),
                sbw(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: heading.copyWith(
                        fontFamily: "RedHat",
                        height: 1.2,
                      ),
                    ),
                    const Text(
                      email,
                      style: TextStyle(
                          color: Color(0xFF848383),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 15,
                          color: Color(0xFFF7AA20),
                        ),
                        sbw(5),
                        Text(
                          date.split(" ").first,
                          style: const TextStyle(
                              color: Color(0xFF827F7F),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            sbh(5),
            Text(
              review,
              style: bodystyle.copyWith(fontSize: 15, height: 1.4),
            ),
            sbh(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                          color: Color(0xFFF7AA20),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          height: 1.0),
                    ),
                    sbw(5),
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color(0xFFF7A81A),
                      ),
                      itemCount: 5,
                      itemSize: 18.0,
                    ),
                  ],
                ),
                const Likedarea()
              ],
            )
          ],
        ),
      ),
    );
  }
}
