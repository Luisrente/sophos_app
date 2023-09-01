part of 'movie_cubit.dart';

class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}



class MovieReady extends MovieState {
  final List<Movie> itemList;
    final SortOptions _sortBy;

  MovieReady(this._sortBy,this.itemList);

  @override
  List<Object?> get props => [_sortBy,itemList];
}

class MovieLoading extends MovieState {}

class MovieErrorState extends MovieState {
  final String error;
  MovieErrorState(this.error);
}
