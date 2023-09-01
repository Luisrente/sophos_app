import '/src/data/models/models.dart';

abstract class PostDataSource {
  Future<List<Post>> getPosts();
}
