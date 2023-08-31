import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/domain/entities/entities.dart';
import '/src/domain/usescases/usescases.dart';
import '/main.dart';


part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {

  final GetItemsUseCase getItemsUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  
  List<Movie> itemList = [];
  SortOptions _sortBy = SortOptions.id;

  ItemCubit({
    required this.getItemsUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(ItemInitial()) {
    _loadItems();
  }

  Future<void> _loadItems() async {
    emit(ItemInitial());
    
      itemList = await getItemsUseCase.getItems();
      _sortItems();
   
  }

  void _sortItems() {
    switch (_sortBy) {
      case SortOptions.title:
        itemList.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortOptions.id:
        itemList.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
    emit(ItemReady(_sortBy, itemList));
  }

  void changeSort(SortOptions sortBy) {
    _sortBy = sortBy;
    _sortItems();
  }

  Future<void> toggleFavorite(Movie item) async {
    await toggleFavoriteUseCase.toggleFavorite(item);
    _loadItems();
  }
}
