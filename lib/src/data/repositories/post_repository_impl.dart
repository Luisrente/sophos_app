import '/src/data/models/post/post_model.dart';
import '/src/domain/datasources/datasources_interfaces.dart';
import '/src/domain/repositories/repositories_interface.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts() async {
    final List<Post> posts = await remoteDataSource.getPosts();
    return posts;
  }
}
