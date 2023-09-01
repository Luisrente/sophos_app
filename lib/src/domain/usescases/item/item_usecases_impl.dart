import 'package:sophos_app/src/data/models/item/item_model.dart';
import '/src/domain/repositories/repositories_interface.dart';

class ItemsUseCase {
  final ItemRepository repository;

  ItemsUseCase(
      {required this.repository});

  Future<List<Item>> getItems() async {
    final itemsFromRepository = await repository.getItems();
    return itemsFromRepository;
  }
}



