import 'package:sophos_app/src/data/models/models.dart';
import 'package:sophos_app/src/domain/repositories/repositories_interface.dart';

class GetItemsUseCase  {
  final ItemRepository repository;

  GetItemsUseCase({required this.repository});

  Future<List<Item>> getItems() async {
    return await repository.getItems();
  }
}


class ToggleFavoriteUseCase  {
  final ItemRepository repository;

  ToggleFavoriteUseCase({required this.repository});

  Future<void> toggleFavorite(Item item) async {
    await repository.toggleFavorite(item);
  }
}
