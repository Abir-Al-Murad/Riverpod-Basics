import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%204/your_provider.dart';

class HandleMultipleState extends ConsumerWidget {
  const HandleMultipleState({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print("Building Everything");
    return Scaffold(
      appBar: AppBar(title:Text("Handle Multiple State"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer(
            builder: (context,ref,child){
              // final sliderValue = ref.watch(appStateProvider); // ek e class er value tai ekta change hole egulao rebuild hoy
              final sliderValue = ref.watch(appStateProvider.select((state)=>state.showPassword)); // ekhane only showPassword state select korechi tai only etai change hole build hobe
              return InkWell(
                onTap: (){
                  print("Build Eye");
                  final current = ref.read(appStateProvider.notifier);
                  current.state = current.state.copyWith(showPass: !sliderValue);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: sliderValue ? Icon(Icons.remove_red_eye):Icon(Icons.remove_red_eye_outlined),
                ),
              );
            },
          ),
          Consumer(
            builder: (context,ref,child){
              print("Build Container");
              final sliderValue = ref.watch(appStateProvider.select((state)=>state.slider));
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(sliderValue),
              );
            },
          ),Consumer(
            builder: (context,ref,child){
              print("Build slider");
              final sliderValue = ref.watch(appStateProvider.select((state)=>state.slider));
              return Slider(value: sliderValue, onChanged: (value){
               final stateProvider =  ref.read(appStateProvider.notifier);
               stateProvider.state = stateProvider.state.copyWith(slidr: value);
              });

            },
          ),
        ],
      ),
    );
  }
}
