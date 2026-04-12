import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%2010(Get%20API)/post_model.dart';
import 'package:http/http.dart' as http;

final postProvider = FutureProvider<List<Post_Model>>((ref)async{
  try{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      List<Post_Model> postList = data.map((e)=> Post_Model.fromJson(json: e)).toList();
      return postList;
    }else{
      throw 'Something went wrong';
  }
  }on SocketException{
    throw "No Internet";
  }catch(e){
    rethrow;
  }
});