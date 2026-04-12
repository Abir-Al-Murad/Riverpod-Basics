import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/state_provider_cls3.dart';

class CounterHomeScreen extends ConsumerWidget {
  const CounterHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterValue = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Counter Home Screen")),
      body: Center(child: Text('$counterValue')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(countProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
