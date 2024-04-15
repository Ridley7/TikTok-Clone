import 'package:tik_tok_clone/domain/entities/video_post.dart';

abstract class VideoPostRepository{

  Future<List<VideoPost>> getVideos();

}