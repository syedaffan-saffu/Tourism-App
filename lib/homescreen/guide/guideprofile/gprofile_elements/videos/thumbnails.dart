import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trekkers_pk/homescreen/guide/guideprofile/gprofile_elements/aboutus.dart';
import 'package:trekkers_pk/homescreen/guide/guideprofile/gprofile_elements/videos/videos.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final GlobalKey _columnkey = GlobalKey();

class Thumbnails extends StatelessWidget {
  const Thumbnails({super.key});

  final List<String> urls = const [
    "https://www.youtube.com/watch?v=mkjwxmcdb0E",
    "https://www.youtube.com/watch?v=IUN664s7N-c",
    "https://www.youtube.com/watch?v=cHBqwj0Ed_I"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(key: _columnkey, children: [
      const Text(
        AboutUs.description,
        style: TextStyle(
          color: Color(0xFF848484),
        ),
      ),
      sbh(15),
      Column(
        children: List.generate(
            3,
            (index) => bthumbnails(
                thumbsURL()[index]!, context, converturlstoID(urls)[index]!)),
      ),
    ]);
  }

  List<String?> converturlstoID(List<String> urls) {
    List<String?> convertedurls = ['', '', ''];
    for (var i = 0; i < 3; i++) {
      convertedurls[i] = YoutubePlayer.convertUrlToId(
        urls[i],
      );
    }
    return convertedurls;
  }

  List<String?> thumbsURL() {
    List<String?> videoIDs = converturlstoID(urls);
    List<String> thumbnails = ['', '', ''];
    for (var i = 0; i < 3; i++) {
      thumbnails[i] = YoutubePlayer.getThumbnail(
          videoId: videoIDs[i]!, webp: false, quality: 'mqdefault');
    }
    return thumbnails;
  }

  Widget bthumbnails(String thumbnail, BuildContext context, String videoid) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              thumbnail,
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.fill,
              color: const Color(0x4F000000),
            ),
          ),
          Center(
              child: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => YTPlayer(videoid: videoid)));
            },
            icon: SvgPicture.asset(
              "assets/icons/yticon.svg",
              height: 60,
              fit: BoxFit.fill,
            ),
          )),
        ],
      ),
    );
  }
}
