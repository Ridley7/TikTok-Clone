import 'package:flutter/material.dart';
import 'package:tik_tok_clone/presentation/widgets/video/video_gradient.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  const FullScreenPlayer({super.key, required this.videoUrl, required this.caption});

  final String videoUrl;
  final String caption;

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl);
    controller.setVolume(0);
    controller.setLooping(true);
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
          }

          return GestureDetector(
            onTap: (){
              if(controller.value.isPlaying){
                controller.pause();
                return;
              }

              controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  //Video
                  VideoPlayer(controller),

                  //Gradiente
                  VideoGradient(
                    stops: const [0.8, 1.0],
                  ),

                  //Texto
                  Positioned(
                    bottom: 50,
                      left: 20,
                      child: Text(widget.caption)
                  )
                ],
              ),
            ),

          );
        }
    );
  }
}

class VideoCaption extends StatelessWidget {

  final String caption;

  const VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    //falta el titleStyle

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle,),
    );
  }
}
