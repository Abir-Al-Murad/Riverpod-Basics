import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%205/search_provider.dart';

class StateNotifierProviderCls5 extends ConsumerWidget {
  const StateNotifierProviderCls5({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print("Ahona.....");
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search here",
                  border: OutlineInputBorder(
                  ),
                ),
                onChanged: (value){
                  ref.read(searchProvider.notifier).search(value);
                },
              ),
              Consumer(
                builder: (context,ref,child) {
                  print('Dimu mair');
                  final search = ref.watch(searchProvider.select((state)=>state.search));
                  return Text("Your Searched For : ${search}");
                }
              ),
              Consumer(
                  builder: (context,ref,child) {
                    print('Dimu mair vaya');
                    final iscahnge = ref.watch(searchProvider.select((state)=>state.isChange));
                    return Switch(value: iscahnge, onChanged: (value){
                      ref.read(searchProvider.notifier).onChange(value);
                    });
                  }
              )
            ],
          ),
        ),
      )),
    );
  }
}
