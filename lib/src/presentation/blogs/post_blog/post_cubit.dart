import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophos_app/main.dart';
import 'package:sophos_app/src/data/models/post/post_model.dart';
import '/src/domain/usescases/post/post_usecase.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {

  final GetPostsUseCase getPostsUseCase;
  SortOptions _sortBy = SortOptions.id;
  List<Post> postList = [];

  PostCubit({ required this.getPostsUseCase}) : super(PostInitial()){
        loadPosts();
  }

   Future<void> loadPosts() async {
  
      emit(PostInitial());
      postList = await getPostsUseCase.getPosts();
      sort(_sortBy);
    
  }

   void sort(SortOptions sortBy) {
    _sortBy = sortBy;
    switch (_sortBy) {
      case SortOptions.title:
        postList.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortOptions.id:
        postList.sort((a, b) => a.id.compareTo(b.id));
        break;
    }
    emit(PostReady(_sortBy, postList));
  }




}
