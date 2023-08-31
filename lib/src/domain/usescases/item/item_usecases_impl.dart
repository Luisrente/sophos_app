import 'package:sophos_app/src/data/models/models.dart';
import 'package:sophos_app/src/domain/entities/movie.dart';
import 'package:sophos_app/src/domain/repositories/repositories_interface.dart';

class GetItemsUseCase {
  final ItemRepository repository;
  final LocalStorageRepository localStorageRepository;

  GetItemsUseCase(
      {required this.repository, required this.localStorageRepository});

  Future<List<Item>> getItems() async {
    final item = await repository.getItems();
    final movie = await localStorageRepository
      ..getItems();

    return item;
  }
}

class ToggleFavoriteUseCase {
  final LocalStorageRepository localStorageRepository;

  ToggleFavoriteUseCase({required this.localStorageRepository});

  Future<void> toggleFavorite(Item item) async {
    await localStorageRepository
        .toggleFavorite(Movie(id: 1, title: 'Sol', isFavorite: true));
  }
}
