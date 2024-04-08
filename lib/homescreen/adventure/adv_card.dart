import 'package:flutter/material.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';
import '../../main.dart';
import 'adv_place.dart';

class AdvCard extends StatelessWidget {
  const AdvCard({super.key});

  static const String image = "assets/images/mount.jpg";
  static const String image2 = "assets/images/gliding.png";
  static const String title = "Biafo Glacier Ice Climbing";
  static const String location = " Hindu Kush Range";
  static const String description =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter.";
  static const String price = "250";
  static const String rating = "4.5";
  static const String stay = "10";
  static const List<String> locs_s = [
    'K-2',
    'Nanga Parbat',
    'Gasherbrum',
    'undefine'
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        mynavigatorKey.currentState!
            .push(MaterialPageRoute(builder: (context) => const Advplace()));
      },
      child: CardView(
        img: image,
        title: title,
        locorating: const Row(
          children: [
            Icon(Icons.location_on, color: Colors.blue),
            Text(location)
          ],
        ),
        description: description,
        price: price,
        rating: rating,
        stay: stay,
        iconsrow: const Row(
          children: [
            SizedBox(
              width: 20,
            ),
            SizedBox(
                height: 25,
                width: 25,
                child: Icon(
                  CustomIcons.car_icon,
                  color: Color(0xFFF6AA21),
                )),
            SizedBox(width: 10),
            SizedBox(
                height: 25,
                width: 25,
                child: Icon(
                  CustomIcons.pump_icon,
                  color: Color(0xFFF6AA21),
                )),
            SizedBox(width: 10),
            SizedBox(
                height: 25,
                width: 25,
                child: Icon(
                  CustomIcons.sign_icon,
                  color: Color(0xFFF6AA21),
                )),
            SizedBox(width: 10),
            SizedBox(
                height: 25,
                width: 25,
                child: Icon(
                  CustomIcons.plane_icon,
                  color: Color(0xFFF6AA21),
                )),
          ],
        ),
        tags: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 55,
              height: 23,
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 255, 208, 40),
                    size: 15,
                  ),
                  Text(
                    rating,
                    style: TextStyle(
                      height: 1.0,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 20, 92, 151)),
              height: 45,
              width: 40,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    stay,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        height: 1.2),
                  ),
                  Text(
                    'DAY',
                    style: TextStyle(
                        color: Colors.white,
                        height: 0.7,
                        letterSpacing: 0.0,
                        fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
        btnrow: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                  "\$$price",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "/Person",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(132, 0, 0, 0)),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                backgroundColor: const Color.fromARGB(255, 51, 173, 226),
                elevation: 0.0,
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {},
              child: Text(
                'Book Now',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      height: 1.4,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
