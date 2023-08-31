import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sophos_app/src/config/theme/app_theme.dart';
import 'package:sophos_app/src/presentation/blogs/item_blog/item_cubit.dart';
import 'src/config/helpers/hive_config.dart';
import 'src/domain/repositories/repositories_interface.dart';
import 'src/presentation/blogs/blogs.dart';
import 'src/presentation/screens/screens.dart';
import 'src/dependency_injection.dart' as di;

enum SortOptions { id, title }

void main() async {
  await initializeHive();

  GetIt dir = GetIt.instance;
  di.init();

  GetItemsUseCase getItemsUseCase = GetItemsUseCase(
      repository: dir.get<ItemRepository>(),
      localStorageRepository: dir.get<LocalStorageRepository>());
  ToggleFavoriteUseCase toggleFavoriteUseCase = ToggleFavoriteUseCase(
      localStorageRepository: dir.get<LocalStorageRepository>());
      
  ItemCubit itemCubit = ItemCubit(
      getItemsUseCase: getItemsUseCase,
      toggleFavoriteUseCase: toggleFavoriteUseCase);

  runApp(
    BlocProvider<ItemCubit>(
      create: (_) => itemCubit,
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
      home: const ItemScreen(),
      theme: AppTheme().getTheme(),
    );
  }
}
