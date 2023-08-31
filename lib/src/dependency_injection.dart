import 'package:get_it/get_it.dart';
import '/src/data/datasources/item_localdb_datasource.dart';
import '/src/data/repositories/item_repository_impl.dart';
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

  sl.registerLazySingleton<LocalStorageDatasource>(
    () => HiveLocalDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl<PostDataSource>()),
  );

  sl.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(localDataSource: sl<ItemLocalDataSource>()),
  );

  sl.registerLazySingleton<LocalStorageRepository>(
    () => LocalStorageRepositoryImpl(datasource: sl<LocalStorageDatasource>()),
  );

  // Use cases
  sl.registerLazySingleton(
    () => GetPostsUseCase(postRepository: sl<PostRepository>()),
  );

  sl.registerLazySingleton(
    () => GetItemsUseCase(repository: sl<ItemRepository>(),localStorageRepository:sl< LocalStorageRepository>()),
  );
  sl.registerLazySingleton(
    () => ToggleFavoriteUseCase(localStorageRepository: sl<LocalStorageRepository>()),
  );

  // Cubits
  sl.registerFactory<PostCubit>(
    () => PostCubit(getPostsUseCase: sl<GetPostsUseCase>()),
  );
  sl.registerFactory<ItemCubit>(
    () => ItemCubit(getItemsUseCase: sl<GetItemsUseCase>(),toggleFavoriteUseCase: sl<ToggleFavoriteUseCase>()),
  );
}
