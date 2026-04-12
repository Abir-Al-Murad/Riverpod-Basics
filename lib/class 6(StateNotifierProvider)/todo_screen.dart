import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Bhai"),
      ),
      body:item.isEmpty?Center(child: Text("Nai re Mal Nai"),): ListView.builder(
          itemCount: item.length,
          itemBuilder: (context,index){
            final itemDetail = item[index];
        return ListTile(
          title: Text(itemDetail.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: (){
                    ref.read(itemProvider.notifier).deleteItem(itemDetail.id);
                  },
                  icon:Icon(Icons.delete)),
              IconButton(
                  onPressed: (){
                    ref.read(itemProvider.notifier).updateItem(itemDetail.id, 'Updated Item');
                  },
                  icon:Icon(Icons.edit)),

            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(itemProvider.notifier).addItem('LImda');
      },child: Icon(Icons.dark_mode),),
    );
  }
}

