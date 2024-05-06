import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

class ActivitiesCard extends StatelessWidget {
  final int index;
  final String img;
  final String title;
  final String price;
  final String description;
  final String rating;
  const ActivitiesCard(
      {super.key,
      required this.index,
      required this.img,
      required this.title,
      required this.description,
      required this.price,
      required this.rating});

  static const List<String> sublocs = [
    'K-2',
    'Nanga Parbat',
    'Gasherbrum',
    'undefine'
  ];

  @override
  Widget build(BuildContext context) {
    return CardView(
      img: img,
      title: title,
      description: description,
      price: price,
      rating: rating,
      tags: Tag(
        index: index,
      ),

      ///here
      locorating: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 252, 157, 32),
          ),
          padding: const EdgeInsets.all(4.0),
          child: const Text(
            '8.0',
            style: TextStyle(
                color: Colors.white,
                height: 1.3,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text('Superb: 140 Reviews'),
      ]),
      locs: SizedBox(
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0.0),
                    foregroundColor: const Color.fromARGB(213, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    backgroundColor:
                        Color.fromARGB(150 + (index * 50), 7, 141, 252),
                  ),
                  onPressed: () {},
                  child: Text(
                    sublocs[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              );
            }),
      ),
      btnrow: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 10.0),
                  backgroundColor: const Color.fromARGB(255, 51, 173, 226),
                  elevation: 0.0,
                  shape: const RoundedRectangleBorder()),
              onPressed: () {},
              child: const Text(
                'Read More',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    height: 0.0),
              )),
          SizedBox(height: 20, child: Image.asset('assets/icons/signals.png')),
          const Text('45 persons doing it now')
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final int index;
  const Tag({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final wishlistState = Provider.of<WishlistState>(context);
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color:
                  wishlistState.isFavorited(index) ? Colors.red : Colors.white,
              width: 2,
            )),
        height: 40,
        child: IconButton(
          iconSize: 20,
          enableFeedback: false,
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(padding: EdgeInsets.zero),
          icon: wishlistState.isFavorited(index)
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
          onPressed: () {
            wishlistState.toggleFavorite(index);
          },
        ));
  }
}

class WishlistState with ChangeNotifier {
  Map<int, bool> _wishlistStates = {};

  bool isFavorited(int cardIndex) {
    return _wishlistStates[cardIndex] ?? false;
  }

  void toggleFavorite(int cardIndex) {
    _wishlistStates[cardIndex] = !_wishlistStates[cardIndex]!;
    notifyListeners();
  }
}
