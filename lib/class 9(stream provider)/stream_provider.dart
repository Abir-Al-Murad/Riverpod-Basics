

import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockPriceProvider = StreamProvider((ref)async*{
  final random = Random();
  double currentPrice = 100.0;
  
  while(true){
    await Future.delayed(Duration(seconds: 1));
    currentPrice = currentPrice + random.nextDouble()*4-2;
    yield double.parse(currentPrice.toStringAsFixed(2)); //yield represent - >  Stream value return korte use kora hoy
  }
});