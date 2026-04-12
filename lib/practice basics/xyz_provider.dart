

import 'package:flutter_riverpod/flutter_riverpod.dart';

final xyzProvider = StateNotifierProvider<XYZProvider,List<Person>>((ref){
  return XYZProvider();
});


class XYZProvider extends StateNotifier<List<Person>>{
  XYZProvider():super([
    Person("John", 25,1),
    Person("Jane", 30,2),
    Person("Doe", 35,3),
  ]);

  void changeName(String name, int id){
    // // final personIndex = state.indexWhere((person) => person.id == id);
    // Person person = state.firstWhere((person) => person.id == id);
    // Person newPerson = person.copyWith(name: name);
    //
    //
    // // state = state.copyWith(name: name);
    final index = state.indexWhere((person) => person.id == id);
    if(index ==-1) return;

    final updatedPerson = state[index].copyWith(name: name);
    final newList = [...state];
    newList[index] = updatedPerson;
    state = newList;
  }
  void changeAge(int age,int id){
    state = state.map((x){
      if(x.id == id){
        return x.copyWith(age: age);
      }
      return x;
    }).toList();
  }
}




class Person{
  final int id;
  final String name;
  final int age;

  Person(this.name, this.age,this.id);

  Person copyWith({String? name, int? age}){
    return Person(name??this.name, age??this.age, id);
  }
}