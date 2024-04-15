import 'package:tik_tok_clone/domain/entities/video_post.dart';

abstract class VideoPostDataSource{

  Future<List<VideoPost>> getVideos();

}