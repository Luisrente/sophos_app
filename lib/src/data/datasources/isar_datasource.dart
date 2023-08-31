import 'package:isar/isar.dart';
import '/src/domain/entities/entities.dart';
import '/src/domain/datasources/datasources_interfaces.dart';
import 'package:path_provider/path_provider.dart';



class IsarDatasource extends LocalStorageDatasource {
  
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final directory = await getApplicationDocumentsDirectory();

    if ( Isar.instanceNames.isEmpty ) {
      return await Isar.open([ MovieSchema ],directory: directory.path, inspector: true );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<Movie>> getItems() async {
    final isar = await db;
    return await isar.movies.where().findAll();
  }

  @override
  Future<void> addItem(Movie item) async {
    final isar = await db;
     isar.movies.put(item);
  }



  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;

    final Movie? isFavoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movieId)
      .findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    
    final isar = await db;

    final favoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movie.id)
      .findFirst();

    if ( favoriteMovie != null ) {
      // Borrar
      isar.writeTxnSync(() => isar.movies.deleteSync( favoriteMovie.isarId! ));
      return;
    }

    // Insertar
    isar.writeTxnSync(() => isar.movies.putSync(movie));

  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    
    final isar = await db;

    return isar.movies.where()
      .offset(offset)
      .limit(limit)
      .findAll();
  }

}