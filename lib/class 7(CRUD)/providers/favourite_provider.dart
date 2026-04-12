import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%207(CRUD)/item_model.dart';
import 'package:my_riverpod_app/class%207(CRUD)/providers/favourite_states.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier,FavouriteState>((ref){
  return FavouriteNotifier()  ;
});

class FavouriteNotifier extends StateNotifier<FavouriteState>{
  FavouriteNotifier():super(FavouriteState(allItems: [], filteredItems: [], search: ''));

  void addItem(){
    List<Item_Model> item = [
      Item_Model(name: "MacBook", id: 001, favourite: true),
      Item_Model(name: "iPhone", id: 015, favourite: false),
      Item_Model(name: "G-Force 2063", id: 063, favourite: false),
      Item_Model(name: "Samsung Ultra", id: 041, favourite: false),
      Item_Model(name: "Pixel 6", id: 081, favourite: false),
      Item_Model(name: "iPad Pro 13", id: 018, favourite: true),
    ];
    state = state.copyWith(allItems: item.toList(),filteredItems: item.toList());
  }
  void filterList(String search){
      state = state.copyWith(filteredItems: _filteredItems(state.allItems, search));
  }
  void favouriteList(String option){
    state = state.copyWith(filteredItems: _favouriteItems(state.allItems, option));
  }

  List<Item_Model>_filteredItems(List<Item_Model>items,String query){
    if(query.isEmpty){
      return items;
    }
    return items.where((items)=>items.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  List<Item_Model>_favouriteItems(List<Item_Model>items,String option){
    if(option == 'All'){
      return items;
    }
    return items.where((item)=>item.favourite == true).toList();
  }
}