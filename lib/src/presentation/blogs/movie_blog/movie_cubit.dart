import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/domain/entities/entities.dart';
import '/src/domain/usescases/usescases.dart';
import '/main.dart';


part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {

  final MovieUseCase movieUseCase;
  
  List<Movie> itemList = [];
  SortOptions _sortBy = SortOptions.id;

  MovieCubit({
    required this.movieUseCase,
  }) : super(MovieInitial()) {
    loadItems();
  }

  Future<void> loadItems() async {
    emit(MovieInitial());
    
      itemList = await movieUseCase.getMovies();
      _sortItems();
   
  }

  void _sortItems() {
    switch (_sortBy) {
      case SortOptions.title:
        itemList.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortOptions.id:
        itemList.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
    emit(MovieReady(_sortBy, itemList));
  }

  void changeSort(SortOptions sortBy) {
    _sortBy = sortBy;
    _sortItems();
  }

  Future<void> toggleFavorite(Movie item) async {
    await movieUseCase.toggleFavorite(item);
    loadItems();
  }
}
