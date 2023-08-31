import 'package:sophos_app/src/domain/entities/movie.dart';

abstract class LocalStorageRepository {

  Future<void> toggleFavorite( Movie movie );
  Future<List<Movie>> getItems();
  
}