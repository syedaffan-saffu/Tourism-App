import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trekkers_pk/homescreen/guide/guideprofile/gprofilecomp/aboutus.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  final List<String> videourls = [
    "https://www.youtube.com/watch?v=mkjwxmcdb0E",
    "https://www.youtube.com/watch?v=IUN664s7N-c",
    "https://www.youtube.com/watch?v=cHBqwj0Ed_I"
  ];
  late YoutubePlayerController _ytcontroller1;
  late YoutubePlayerController _ytcontroller2;
  late YoutubePlayerController _ytcontroller3;
  bool _ready1 = false;
  bool _ready2 = false;
  bool _ready3 = false;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videourls.first);
    final videoID2 = YoutubePlayer.convertUrlToId(videourls[1]);
    final videoID3 = YoutubePlayer.convertUrlToId(videourls[2]);
    _ytcontroller1 = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          disableDragSeek: true,
        ));
    _ytcontroller2 = YoutubePlayerController(
        initialVideoId: videoID2!,
        flags: const YoutubePlayerFlags(
          disableDragSeek: true,
          autoPlay: false,
        ));
    _ytcontroller3 = YoutubePlayerController(
        initialVideoId: videoID3!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          disableDragSeek: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        AboutUs.description,
        style: TextStyle(
          color: Color(0xFF848484),
        ),
      ),
      sbh(15),
      YTPlayer(
          ytcontroller: _ytcontroller1,
          ready: _ready1,
          onReady: () {
            setState(() {
              _ready1 = true;
            });
          },
          onPressed: () {
            setState(() {
              _ytcontroller1.play();
              _ready1 = false;
            });
          }),
      sbh(15),
      YTPlayer(
          ytcontroller: _ytcontroller2,
          ready: _ready2,
          onReady: () {
            setState(() {
              _ready2 = true;
            });
          },
          onPressed: () {
            setState(() {
              _ytcontroller2.play();
              _ready2 = false;
            });
          }),
      sbh(15),
      YTPlayer(
          ytcontroller: _ytcontroller3,
          ready: _ready3,
          onReady: () {
            setState(() {
              _ready3 = true;
            });
          },
          onPressed: () {
            setState(() {
              _ytcontroller3.play();
              _ready3 = false;
            });
          })
    ]);
  }
}

class YTPlayer extends StatelessWidget {
  final YoutubePlayerController ytcontroller;
  final bool ready;
  final void Function() onReady;
  final void Function() onPressed;
  const YTPlayer({
    super.key,
    required this.ytcontroller,
    required this.ready,
    required this.onReady,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        YoutubePlayer(
          onReady: onReady,
          controller: ytcontroller,
          showVideoProgressIndicator: true,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
            )
          ],
        ),
        ready
            ? Container(
                height: 205,
                width: double.maxFinite,
                color: const Color(0x4F000000),
                child: Center(
                    child: IconButton(
                  onPressed: onPressed,
                  icon: SvgPicture.asset(
                    "assets/icons/yticon.svg",
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                )),
              )
            : const SizedBox(),
      ],
    );
  }
}
