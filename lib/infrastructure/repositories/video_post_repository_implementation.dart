import 'package:tik_tok_clone/domain/data_sources/video_post_data_source.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImplementation implements VideoPostRepository{

  final VideoPostDataSource videoPostDataSource;

  VideoPostRepositoryImplementation({required this.videoPostDataSource});

  @override
  Future<List<VideoPost>> getVideos() {
    return videoPostDataSource.getVideos();
  }

}