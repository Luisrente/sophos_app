part of 'post_cubit.dart';

class PostState extends Equatable {
  @override
  List<Object?> get props =>[];
}


final class PostInitial extends PostState {}

class PostReady extends PostState{
  final SortOptions _sortBy;
  final List<Post> postList;
  PostReady(this._sortBy,  this.postList);
   @override
  List<Object?> get props =>[_sortBy,postList];
}

class PostLoading extends PostState {}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}
