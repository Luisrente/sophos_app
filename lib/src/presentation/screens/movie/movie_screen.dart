import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophos_app/src/presentation/widgets/widgets.dart';

import '../../blogs/blogs.dart';

class MovieScreen2 extends StatelessWidget {
  const MovieScreen2({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final itemCubit = context.read<MovieCubit>();

    return BlocProvider<MovieCubit>(
      create: (_) => itemCubit,
      child: Column(
        children: [

           
              CustomSearchBar(
                labelTextField: 'Buscar películas...',
                labelButton: 'Buscar',
                margin: EdgeInsets.all(10.0),
                onSearch: (query) {
                  itemCubit.filterMovies(query);
                },
              ),
              
            
          Expanded(child: const ItemList()),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieReady) {
          final items = state.itemList;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return MovieItem(
                movie: item,
                onMovieSelected: () {
                  BlocProvider.of<MovieCubit>(context).toggleFavorite(item);
                },
              );
            },
          );
        } else if (state is MovieErrorState) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
