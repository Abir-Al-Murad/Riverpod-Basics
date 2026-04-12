import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%2010(Get%20API)/post_provider.dart';

class GetApiScreen extends ConsumerWidget {
  const GetApiScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API + FutureProvider"),
      ),
      body: Consumer(builder: (context,ref,child){
        final result = ref.watch(postProvider);
        return Center(
          child: result.when(data: (value){
            return ListView.builder(
                itemCount:  value.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value[index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(value[index].body.toString()),
                          ],
                        ),
                      ),
                    ),
                  );
            });
          }, error: (error,stack){
            return GestureDetector(
                onTap: (){
                  ref.invalidate(postProvider);
                },
                child: Text("Error: $error"));
          }, loading: (){
            return const CircularProgressIndicator();
          })
        );
      })
    );
  }
}
