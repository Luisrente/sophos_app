import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/src/presentation/screens/movie/movie_screen.dart';
import '/src/presentation/widgets/custom/custom_appbar.dart';
import '/src/presentation/widgets/widgets.dart';

import '../../../../main.dart';
import '../../blogs/blogs.dart';
import '../../blogs/cubit_navigator/navigator_cubit.dart';
import '../screens.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (__) => NavigatorCubit(),
        child: Scaffold(
          appBar: CustomAppBar(
            titleP: "Sophos solutions",
            centerTitle2: false,
            action: [
              BlocBuilder<NavigatorCubit, NavigatorState2>(
                builder: (context, state) {
                  return state.currentPage == 1
                      ? PopupMenuButton<SortOptions>(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: SortOptions.id,
                              child: ListTile(
                                title: Text('Ordenar por ID'),
                                trailing: Icon(Icons.sort),
                              ),
                            ),
                            const PopupMenuItem(
                              value: SortOptions.title,
                              child: ListTile(
                                title: Text('Ordenar por title'),
                                trailing: Icon(Icons.sort),
                              ),
                            )
                          ],
                          onSelected: context.read<PostCubit>().sort,
                        )
                      : PopupMenuButton<SortOptions>(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: SortOptions.id,
                              child: ListTile(
                                title: Text('Ordenar por Letra'),
                                trailing: Icon(Icons.sort),
                              ),
                            ),
                          ],
                          onSelected: context.read<PostCubit>().sort,
                        );
                },
              ),
            ],
          ),
          body: PageView(
            controller: _pageController,
            children: [MovieScreen2(), PostScreen(),NumberFilterScreen() ],
          ),
          bottomNavigationBar: BlocBuilder<NavigatorCubit, NavigatorState2>(
            // buildWhen: (previous, current) => current.counter != previous.counter,
            builder: (context, state) {
              return CustomBottomNavigation(
                currentIndex: state.currentPage,
                onpress: (i) {
                  log("INDEX $i");
                  actionPage(i);
                  increaseBydecrement(context, i);
                },
              );
            },
          ),
        ));
  }

  void increaseBydecrement(BuildContext context, [int value = 0]) {
    context.read<NavigatorCubit>().updatePage(value);
  }

  void actionPage(int indexPage) {
    _pageController.animateToPage(indexPage,
        duration: Duration(microseconds: 250), curve: Curves.easeInOut);
  }
}
