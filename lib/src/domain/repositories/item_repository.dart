import 'package:sophos_app/src/data/models/models.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();
  Future<void> toggleFavorite(Item item);
}