import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophos_app/src/presentation/blogs/item_blog/item_cubit.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sophos'),
        ),
        body: const ItemList());
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
              return ListTile(
                leading: Image.network(item.imageUrl),
                title: Text(item.title),
                trailing: IconButton(
                  icon: Icon(
                    item.isFavorite ? Icons.star : Icons.star_border,
                  ),
                  onPressed: () {
                    BlocProvider.of<ItemCubit>(context).toggleFavorite(item);
                  },
                ),
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
