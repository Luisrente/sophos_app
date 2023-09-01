import 'package:hive/hive.dart';
import '/src/domain/entities/entities.dart';
import '/src/domain/datasources/datasources_interfaces.dart';

class MovieDataSourceImpl extends MovieDatasource {

 final Box<Movie> movieBox = Hive.box<Movie>('movies');

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final favoriteMovie = movieBox.get(movie.title);
    if (favoriteMovie != null) {
      favoriteMovie.isFavorite = !favoriteMovie.isFavorite;
      await movieBox.put(movie.title, favoriteMovie);
    } else {
      final newMovie = movie.copyWith(isFavorite: !movie.isFavorite);
      await movieBox.put(movie.title, newMovie);
    }
  }
  
 @override
Future<List<Movie>> getMovies() async {
  final List<Movie> movies = movieBox.values.toList();
  return movies;
}


}
