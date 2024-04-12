import 'package:flutter/cupertino.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/infrastructure/local_video_model.dart';
import 'package:tik_tok_clone/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadVideos() async{

    await Future.delayed( const Duration(seconds: 2) );

    final List<VideoPost> newVideos = videoPosts.map(
            (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}