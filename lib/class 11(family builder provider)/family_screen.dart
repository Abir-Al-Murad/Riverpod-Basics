import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%2011(family%20builder%20provider)/family_provider.dart';

class FamilyScreen extends ConsumerWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Map<String,dynamic> map = {
      'id':20
    };
    final result = ref.watch(multiplierProvider(map));
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Provider"),
      ),
      body: Center(
        child: Text(result.toString()),
      ),
    );
  }
}
