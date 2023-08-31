import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophos_app/src/presentation/blogs/item_blog/item_cubit.dart';
import 'package:sophos_app/src/presentation/widgets/widgets.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemCubit = context.read<ItemCubit>(); 
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sophos'),
        ),
        body: BlocProvider<ItemCubit>(
      create: (_) => itemCubit,
      child: const ItemList(),
      

    ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: 1)
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        if (state is ItemInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ItemLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ItemReady) {
          final items = state.itemList;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return MovieItem(
                movie: item,
                onMovieSelected: () {
                    BlocProvider.of<ItemCubit>(context).toggleFavorite(item);
                },
              );
            },
          );
        } else if (state is ItemErrorState) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
