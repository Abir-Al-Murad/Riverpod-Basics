

import 'package:flutter_riverpod/flutter_riverpod.dart';


//A FamlyProvider that takes an integer parameter and returns  a modified value
final multiplierProvider = StateProvider.family<int,Map<String,dynamic>>((ref,number){        //1st one is state 2nd is ki value pass korbo
  return number['id']*6;
});