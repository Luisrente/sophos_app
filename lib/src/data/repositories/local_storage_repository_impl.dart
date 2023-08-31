import 'package:sophos_app/src/domain/datasources/datasources_interfaces.dart';
import 'package:sophos_app/src/domain/entities/entities.dart';
import 'package:sophos_app/src/domain/repositories/repositories_interface.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
  
  @override
  Future<void> addItem(Movie movie) {
       return datasource.toggleFavorite(movie);

  }
  
  @override
  Future<List<Movie>> getItems() {
   return datasource.getItems();
  }
}
