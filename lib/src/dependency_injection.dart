import 'package:get_it/get_it.dart';
import 'package:sophos_app/src/presentation/blogs/blogs.dart';
import '/src/domain/usescases/usescases.dart';
import '/src/domain/repositories/repositories_interface.dart';
import '/src/data/repositories/repositories.dart';
import '/src/domain/datasources/datasources_interfaces.dart';
import '/src/data/datasources/datasources.dart';


final GetIt sl = GetIt.instance;

void init() {
  // Data sources
  sl.registerLazySingleton<PostDataSource>(
    () => PostRemoteDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl<PostDataSource>()),
  );

  // Use cases
  sl.registerLazySingleton(
    () => GetPostsUseCase(postRepository: sl<PostRepository>()),
  );

  // Cubits
  sl.registerFactory<PostCubit>(
    () => PostCubit(getPostsUseCase: sl<GetPostsUseCase>()),
  );
}
