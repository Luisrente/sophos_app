import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophos_app/main.dart';
import 'package:sophos_app/src/data/models/models.dart';
import 'package:sophos_app/src/presentation/blogs/blogs.dart';
import '/src/presentation/widgets/widgets.dart';
enum SortOption{ id , title}

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sophos"),
        actions: <Widget>[
          PopupMenuButton<SortOptions>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: SortOptions.id,
                child:  ListTile(
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
        ],
      ),
      body:  Column(
        children: [
             Expanded( child: BlocBuilder<PostCubit, PostState>(
                    builder: (_, state) {
                      if (state is PostReady) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.postList.length,
                          itemBuilder: (context, index) {
                            Post item = state.postList[index];
                            return Column(
                              children: [
                                CustomCardPost(id: item.id, title: item.title, body: item.body),
                                const Divider(),
                              ],
                            );
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

