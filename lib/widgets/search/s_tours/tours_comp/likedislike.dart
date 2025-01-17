import 'package:flutter/material.dart';

class LikeDislike extends StatefulWidget {
  const LikeDislike({
    super.key,
  });

  @override
  State<LikeDislike> createState() => _LikeDislikeState();
}

class _LikeDislikeState extends State<LikeDislike> {
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
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isliked
                    ? const Color(0xFF48B5E4)
                    : const Color(0xFFD6D5D4),
                width: 2,
              )),
          height: 30,
          child: IconButton(
              highlightColor: Colors.transparent,
              iconSize: 16,
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
                color: _isliked
                    ? const Color(0xFF48B5E4)
                    : const Color(0xFFD6D5D4),
              )),
        ),
        Text(_likes.toString()),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isdisliked
                    ? const Color(0xFF777799)
                    : const Color(0xFFD6D5D4),
                width: 2,
              )),
          height: 30,
          child: IconButton(
              highlightColor: Colors.transparent,
              iconSize: 16,
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  _isdisliked = !_isdisliked;
                  _isliked
                      ? {
                          _isliked = false,
                          _likes > _initlikes ? _likes-- : null
                        }
                      : null;
                  _isdisliked && _dislikes < _initdislikes + 1
                      ? _dislikes++
                      : _dislikes = _initdislikes;
                });
              },
              icon: Icon(
                Icons.thumb_down_rounded,
                color: _isdisliked
                    ? const Color(0xFF777799)
                    : const Color(0xFFD6D5D4),
              )),
        ),
        Text(_dislikes.toString()),
      ],
    );
  }
}
