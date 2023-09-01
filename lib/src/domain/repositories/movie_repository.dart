import '/src/domain/entities/movie.dart';

abstract class MovieRepository {

  Future<void> toggleFavorite( Movie movie );
  Future<List<Movie>> getMovies();
  
}