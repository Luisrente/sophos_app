import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sophos_app/src/config/theme/app_theme.dart';
import 'package:sophos_app/src/domain/usescases/usescases.dart';
import 'src/domain/repositories/repositories_interface.dart';
import 'src/presentation/blogs/blogs.dart';
import 'src/presentation/screens/screens.dart';
import 'src/dependency_injection.dart' as di;

enum SortOptions { id, title }

void main() {
  GetIt dir = GetIt.instance; 
  di.init(); 
   GetPostsUseCase getPostsUseCase=  GetPostsUseCase(postRepository: dir.get<PostRepository>());
    PostCubit postCubit = PostCubit(getPostsUseCase: getPostsUseCase);
    runApp(
    BlocProvider<PostCubit>(
      create: (_) => postCubit,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const PostScreen(),
      theme: AppTheme().getTheme(),
    );
  }
}
