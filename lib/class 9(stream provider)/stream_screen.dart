import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%209(stream%20provider)/stream_provider.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print("Building");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Screen"),
      ),
      body: Consumer(
        builder: (context,ref,child){
          final result = ref.watch(stockPriceProvider);
          return  Center(
            child: result.when(
                skipLoadingOnRefresh: false,
                data: (value)=>Text(value.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22) ,), error: (error,stack){
              return Text("Some Error Occured");
            }, loading: ()=>const CircularProgressIndicator()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        ref.invalidate(stockPriceProvider);
      },child: Icon(Icons.refresh_outlined),),
    );
  }
}
