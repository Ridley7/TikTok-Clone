import 'package:flutter/material.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/presentation/widgets/shared/video_buttons.dart';
import 'package:tik_tok_clone/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;


  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection:Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: videos.length,
        itemBuilder: (context, index){
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //Video player + gradiente
            SizedBox.expand(
              child: FullScreenPlayer(
                  videoUrl: videoPost.videoUrl,
                  caption: videoPost.caption
              ),
            ),

            //Botones
            Positioned(
              bottom: 40,
                right: 20,
                child: VideoButtons(video: videoPost,)
            )
          ],
        );

        }
    );
  }
}
