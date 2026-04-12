import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%208(future%20provider)/future_provider.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider")),
      body: Center(
        child: result.when(
          skipLoadingOnRefresh: false,
          data: (value) {
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return ExpansionTile(title: Text(value[index].toString()));
              },
            );
          },
          error: (error, stack) {
            return Text(error.toString());
          },
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.invalidate(futureProvider);
      },child: Icon(Icons.refresh_outlined),),
    );
  }
}
