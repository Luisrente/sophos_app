import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
import '../../blogs/blogs.dart';
import '../../widgets/widgets.dart';

enum SortOption { id, title }

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<PostCubit, PostState>(
            builder: (_, state) {
              if (state is PostReady) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    Post item = state.postList[index];
                    return Column(
                      children: [
                        CustomCardPost(
                            id: item.id, title: item.title, body: item.body),
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
    );
  }
}
