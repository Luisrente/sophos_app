import 'package:sophos_app/src/domain/entities/movie.dart';

abstract class MovieDatasource {
  
  Future<void> toggleFavorite(Movie movie);
  Future<List<Movie>> getMovies();

}
