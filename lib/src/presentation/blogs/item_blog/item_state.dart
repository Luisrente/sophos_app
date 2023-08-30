part of 'item_cubit.dart';

class ItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ItemInitial extends ItemState {}



class ItemReady extends ItemState {
  final List<Item> itemList;
    final SortOptions _sortBy;

  ItemReady(this._sortBy,this.itemList);

  @override
  List<Object?> get props => [_sortBy,itemList];
}

class ItemLoading extends ItemState {}

class ItemErrorState extends ItemState {
  final String error;
  ItemErrorState(this.error);
}
