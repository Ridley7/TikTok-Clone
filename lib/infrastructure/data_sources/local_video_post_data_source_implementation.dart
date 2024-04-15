import 'package:tik_tok_clone/domain/data_sources/video_post_data_source.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/infrastructure/models/local_video_model.dart';
import 'package:tik_tok_clone/shared/data/local_video_posts.dart';

class LocalVideoPostDataSourceImplementation implements VideoPostDataSource{

  @override
  Future<List<VideoPost>> getVideos() async {

    final List<VideoPost> newVideos = videoPosts.map(
            (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    return newVideos;
  }

}