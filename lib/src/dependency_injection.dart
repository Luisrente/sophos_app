import 'package:get_it/get_it.dart';
import '/src/presentation/blogs/blogs.dart';
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

  sl.registerLazySingleton<ItemLocalDataSource>(
    () => ItemLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<MovieDatasource>(
    () => MovieDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl<PostDataSource>()),
  );

  sl.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(localDataSource: sl<ItemLocalDataSource>()),
  );

  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(datasource: sl<MovieDatasource>()),
  );

  // Use cases
  sl.registerLazySingleton(
    () => GetPostsUseCase(postRepository: sl<PostRepository>()),
  );

  sl.registerLazySingleton(
    () => ItemsUseCase(repository: sl<ItemRepository>()),
  );
  sl.registerLazySingleton(
    () => MovieUseCase(localStorageRepository: sl<MovieRepository>(),repository: sl<ItemRepository>() ),
  );

  // Cubits
  sl.registerFactory<PostCubit>(
    () => PostCubit(getPostsUseCase: sl<GetPostsUseCase>()),
  );
  sl.registerFactory<MovieCubit>(
    () => MovieCubit(movieUseCase: sl<MovieUseCase>()),
  );
}
