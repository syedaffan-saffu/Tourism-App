import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trekkers_pk/homescreen/guide/guideprofile/gprofilecomp/clients/clientscomp.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

class CLientsReview extends StatelessWidget {
  const CLientsReview({super.key});
  static TextStyle heading = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Signika");
  static TextStyle bodystyle = const TextStyle(
      color: Color(0xFF5D6366), fontSize: 18, fontWeight: FontWeight.w600);
  static const String name = "Anna Diskens";
  static const String email = "anna.diskens32@gmail.com";
  static const String review =
      "For someone who had never done a group tour before, it worked out very well! If you love nature, good food and a bit of culture, Ireland is highly recommended!";
  static final DateTime _dateTime = DateTime.now();
  static String date = _dateTime.toString();
  static const double rating = 3.0;
  static bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: List.generate(3, (index) => const ClientsReview()));
  }
}

class Likedarea extends StatefulWidget {
  const Likedarea({
    super.key,
  });

  @override
  State<Likedarea> createState() => _LikedareaState();
}

class _LikedareaState extends State<Likedarea> {
  bool _isliked = false;
  bool _isdisliked = false;
  int _likes = 10;
  static const int _initlikes = 10;
  static const int _initdislikes = 0;
  int _dislikes = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            iconSize: 20,
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                _isliked = !_isliked;
                _isdisliked
                    ? {
                        _isdisliked = false,
                        _dislikes > _initdislikes ? _dislikes-- : null
                      }
                    : null;
                _isliked && _likes < _initlikes + 1
                    ? _likes++
                    : _likes = _initlikes;
              });
            },
            icon: Icon(
              Icons.thumb_up_alt,
              color:
                  _isliked ? const Color(0xFF48B5E4) : const Color(0xFFD6D5D4),
            )),
        Text(_likes.toString()),
        IconButton(
            iconSize: 20,
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                _isdisliked = !_isdisliked;
                _isliked
                    ? {_isliked = false, _likes > _initlikes ? _likes-- : null}
                    : null;
                _isdisliked && _dislikes < _initdislikes + 1
                    ? _dislikes++
                    : _dislikes = _initdislikes;
              });
            },
            icon: Icon(
              Icons.thumb_down_alt,
              color: _isdisliked
                  ? const Color(0xFF777799)
                  : const Color(0xFFD6D5D4),
            )),
        Text(_dislikes.toString()),
      ],
    );
  }
}
