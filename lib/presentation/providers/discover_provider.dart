import 'package:flutter/cupertino.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/domain/repositories/video_post_repository.dart';
import 'package:tik_tok_clone/infrastructure/models/local_video_model.dart';
import 'package:tik_tok_clone/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadVideos() async{

    List<VideoPost> newVideos = await videoPostRepository.getVideos();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}