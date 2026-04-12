import 'package:my_riverpod_app/class%207(CRUD)/item_model.dart';

class FavouriteState{
  final List<Item_Model> allItems;
  final List<Item_Model> filteredItems;
  final String search;
  FavouriteState({required this.allItems,required this.filteredItems,required this.search});

  FavouriteState copyWith({List<Item_Model>? allItems,List<Item_Model>? filteredItems,String? search}){
    return FavouriteState(allItems: allItems??this.allItems, filteredItems: filteredItems??this.filteredItems, search: search ?? this.search );
  }
}