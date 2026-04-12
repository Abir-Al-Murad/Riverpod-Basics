import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%207(CRUD)/providers/favourite_provider.dart';

class Screen extends ConsumerWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(title: Text("CRUD"),actions: [
        PopupMenuButton<String>(
            onSelected: (value){
              ref.read(favouriteProvider.notifier).favouriteList(value);
            },
            itemBuilder: (BuildContext context){
              return const[
                PopupMenuItem(child: Text("All"),value: 'All',),
                PopupMenuItem(child: Text("Favourite"),value: 'Favourite',),
              ];
            })
      ],),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
               border: OutlineInputBorder(),
            ),
            onChanged: (value){
              ref.read(favouriteProvider.notifier).filterList(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favouriteList.filteredItems.length,
              itemBuilder: (context, index) {
                final item = favouriteList.filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Icon(item.favourite?Icons.favorite_outlined:Icons.favorite_outline),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
