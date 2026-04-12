import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});


//Stateless and Statefull(ConsumerStatefulWidget) er same kaj e shudu life cycle er jonno statefull use kora lage
class StateProviderCls3 extends ConsumerWidget {
  const StateProviderCls3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchvalue = ref.watch(switchProvider);
    print("Build 1");
    return Scaffold(
      appBar: AppBar(title: Text("State Provider"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                print("Consumer use korar karone only ei widget tai rebuild hocche jkhn countProvider notify hocche");
                final countervalue = ref.watch(countProvider);
                return Text("$countervalue", style: TextStyle(fontSize: 20));
              },
            ),
            Switch(
              value: switchvalue,
              onChanged: (value) {
                print("Switch e amra consumer use korini tai jkhn er value update hobe tkhn puro screen ta rebuild korbe");
                ref.read(switchProvider.notifier).state = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(countProvider.notifier).state++;
                  },
                  icon: Icon(Icons.add),
                  color: Colors.green,
                ),
                IconButton(
                  onPressed: () {
                    ref.read(countProvider.notifier).state--;
                  },
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
