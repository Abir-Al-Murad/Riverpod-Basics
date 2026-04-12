import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'items.dart';

final itemProvider = StateNotifierProvider<ItemNotifier,List<Item>>((ref){  //StateNotifierProvider er 2ta jinish lage 1.StateNotifier 2.State Type
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>>{
  ItemNotifier():super([]);

  void addItem(String name){
    final item = Item(id: DateTime.now().toString(), name: name);
    state.add(item);
    state = state.toList();
  }
  void deleteItem(String id){
    state.removeWhere((item)=>item.id == id);
    state = state.toList();
  }

  void updateItem(String id,String name){
    int foundIndex = state.indexWhere((state)=>state.id == id);
    state[foundIndex].name = name;
    state = state.toList();
  }
}