import 'package:sophos_app/src/domain/entities/movie.dart';

abstract class LocalStorageRepository {

  Future<void> toggleFavorite( Movie movie );
  
  Future<bool> isMovieFavorite( int movieId );

  Future<List<Movie>> loadMovies({ int limit = 10, offset = 0 });

   Future<List<Movie>> getItems();
  Future<void> addItem(Movie movie);
  
}