import 'package:sophos_app/src/data/models/models.dart';
import 'package:sophos_app/src/domain/datasources/datasources_interfaces.dart';
import 'package:sophos_app/src/domain/repositories/repositories_interface.dart';


class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource localDataSource;

  ItemRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Item>> getItems() async {
    return localDataSource.getItems();
  }

  @override
  Future<void> toggleFavorite(Item item) async {
    await localDataSource.toggleFavorite(item);
  }
}
