import 'package:sophos_app/src/domain/datasources/datasources_interfaces.dart';
import 'package:sophos_app/src/domain/entities/entities.dart';
import 'package:sophos_app/src/domain/repositories/repositories_interface.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl({required this.datasource});


  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
  
  @override
  Future<List<Movie>> getItems() {
     return datasource.getItems();
  }
  
 
 
}
