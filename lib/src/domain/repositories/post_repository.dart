import '/src/data/models/post/post_model.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
