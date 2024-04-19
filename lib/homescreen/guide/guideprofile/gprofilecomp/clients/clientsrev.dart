import 'package:flutter/material.dart';
import 'package:trekkers_pk/homescreen/guide/guideprofile/gprofilecomp/clients/clientscomp.dart';

class CLientsReviews extends StatelessWidget {
  const CLientsReviews({super.key});

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
