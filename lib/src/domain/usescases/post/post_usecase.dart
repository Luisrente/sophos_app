import '/src/domain/repositories/post_repository.dart';
import '/src/data/models/post/post_model.dart';

class GetPostsUseCase  {
  final PostRepository postRepository; 

  GetPostsUseCase({ required this.postRepository});

  
  Future<List<Post>> getPosts() async {
    try {
      final posts = await postRepository.getPosts();
      return posts;
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
  
}
