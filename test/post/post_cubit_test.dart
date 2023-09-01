import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sophos_app/src/domain/repositories/repositories_interface.dart';
import 'package:sophos_app/src/domain/usescases/usescases.dart';
import 'package:sophos_app/src/presentation/blogs/post_blog/post_cubit.dart';
import 'package:sophos_app/src/data/models/models.dart';

class MockPostRepository extends PostRepository {
  
  @override
  Future<List<Post>> getPosts() async => [
        Post(id:1, userId: 1, title: 'Pelicula 1 ', body: 'userId'),
        Post(id:2, userId: 2, title: 'Pelicula 2', body: '111'),
      ];
}

void main() {
  group('PostCubit', () {
    late PostCubit postCubit;
    late MockPostRepository mockPostRepository;

    setUp(() {
      mockPostRepository = MockPostRepository();
      postCubit = PostCubit(getPostsUseCase: GetPostsUseCase(postRepository: mockPostRepository));
    });

    blocTest<PostCubit, PostState>(
      'News are loaded correctly',
      build: () => postCubit,
      act: (cubit) => cubit.loadPosts(),
      expect: () => [
        isA<PostInitial>(),
        isA<PostReady>(),
      ],
    );

    blocTest<PostCubit, PostState>(
      'Default sorted by id',
      build: () => postCubit,
      act: (cubit) => cubit.loadPosts(),
      expect: () => [
        isA<PostInitial>(),
        isA<PostReady>(),
      ],
      verify: (cubit) {
        final readyState = cubit.state as PostReady;

        expect(readyState.postList.length, 2);
        expect(readyState.postList[0].id, 1);
        expect(readyState.postList[1].id, 2);
      },
    );
  });
}
