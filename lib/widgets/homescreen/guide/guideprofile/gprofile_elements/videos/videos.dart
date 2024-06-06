import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTPlayer extends StatelessWidget {
  final String videoid;
  const YTPlayer({
    super.key,
    required this.videoid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: YoutubePlayer(
              aspectRatio: 16 / 12,
              controller: YoutubePlayerController(
                  initialVideoId: videoid,
                  flags: const YoutubePlayerFlags(disableDragSeek: true)),
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
