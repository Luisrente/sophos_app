import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '/src/dependency_injection.dart' as di;
import '/src/config/theme/app_theme.dart';
import 'src/config/hive_config.dart';
import 'src/domain/repositories/repositories_interface.dart';
import '/src/config/routers/app_routers.dart';
import '/src/presentation/blogs/blogs.dart';
import 'src/domain/usescases/usescases.dart';

enum SortOptions { id, title  }

void main() async {
  await initializeHive();
  di.init();
  runApp(createProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}


MultiBlocProvider createProviders() {
  GetIt dir = GetIt.instance;
  // usescases
  MovieUseCase toggleFavoriteUseCase = MovieUseCase(
      localStorageRepository: dir.get<MovieRepository>(),
      repository: dir.get<ItemRepository>()
      );
  GetPostsUseCase getPostsUseCase =
      GetPostsUseCase(postRepository: dir.get<PostRepository>());
  // Cubits
  MovieCubit itemCubit = MovieCubit(movieUseCase: toggleFavoriteUseCase);
  PostCubit postCubit = PostCubit(getPostsUseCase: getPostsUseCase);

  return MultiBlocProvider(
    providers: [
      BlocProvider<MovieCubit>(
        create: (_) => itemCubit,
      ),
      BlocProvider<PostCubit>(
        create: (_) => postCubit,
      ),
    ],
    child: const MyApp(),
  );
}
