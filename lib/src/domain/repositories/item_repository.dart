import '/src/data/models/models.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();
}