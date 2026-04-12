
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Providers define state or logic that can be accessed anywhere in the app.
// ref.watch → Rebuilds widget when provider changes.
// ref.read → Gets value once (no rebuild).

// StateProvider → For mutable state (like setState).
// FutureProvider → For async data (API calls).
// StateNotifierProvider → For complex state logic.



final titleProvider = Provider<String>((ref) {
  return "Good Morning";
});

final ageProvider = Provider<int>((ref){
  return 24;
});



class SimpleProvider extends ConsumerWidget {  //ConsumerWidget rebuild the whole ui
  const SimpleProvider({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) { //ref is the controller for provider
    final ttle = ref.read(titleProvider);
    final age = ref.watch(ageProvider); //Listen to changes
    return Scaffold(
      appBar: AppBar(title: Text('Simple Provider'),),
      body: Center(
        child: Text("$ttle $age"),
      ),
    );
  }
}