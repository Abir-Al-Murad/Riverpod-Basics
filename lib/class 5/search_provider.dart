

import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchNotifier,SearchState>((ref){
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState>{
  SearchNotifier() : super(SearchState(search: '',isChange: false));  // super class parent class er property k initialize korete help kore.

  void search(String query){
    state = state.copyWith(srch: query);
  }
  void onChange(bool x){
    state = state.copyWith(ischange: x);
  }
}

class SearchState{
  final String search;
  final bool isChange;
  SearchState({required this.search,required this.isChange});

  SearchState copyWith({String? srch,bool? ischange}){
    return SearchState(search: srch??this.search,isChange: ischange??this.isChange);
  }
}