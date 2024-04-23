import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trekkers_pk/homescreen/guide/guideprofile/gprofilecomp/aboutus.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

late YoutubePlayerController _ytcontroller1;
late YoutubePlayerController _ytcontroller2;
late YoutubePlayerController _ytcontroller3;

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

  String thumbnail = '';
  @override
  void initState() {
    final videoID1 = YoutubePlayer.convertUrlToId(videourls.first);
    final videoID2 = YoutubePlayer.convertUrlToId(videourls[1]);
    final videoID3 = YoutubePlayer.convertUrlToId(videourls[2]);
    thumbnail = YoutubePlayer.getThumbnail(
      videoId: videoID1!,
    );
    _ytcontroller1 = YoutubePlayerController(
        initialVideoId: videoID1,
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
      Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            thumbnail,
          ),
          Container(
            height: 205,
            width: double.maxFinite,
            color: const Color(0x4F000000),
            child: Center(
                child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/yticon.svg",
                height: 60,
                fit: BoxFit.fill,
              ),
            )),
          ),
        ],
      ),
    ]);
  }

  Widget thumbnails() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          thumbnail,
        ),
        Container(
          height: 205,
          width: double.maxFinite,
          color: const Color(0x4F000000),
          child: Center(
              child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/yticon.svg",
              height: 60,
              fit: BoxFit.fill,
            ),
          )),
        ),
      ],
    );
  }
}

class YTPlayer extends StatelessWidget {
  final YoutubePlayerController ytcontroller;

  const YTPlayer({
    super.key,
    required this.ytcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: ytcontroller,
      showVideoProgressIndicator: true,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
        )
      ],
    );
  }
}
