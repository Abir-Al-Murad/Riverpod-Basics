import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/practice%20basics/xyz_provider.dart';

class XyzScreen extends ConsumerStatefulWidget {
  const XyzScreen({super.key});

  @override
  ConsumerState<XyzScreen> createState() => _XyzScreenState();
}

class _XyzScreenState extends ConsumerState<XyzScreen> {
  @override
  Widget build(BuildContext context) {
    final personProvider = ref.watch(xyzProvider);
    print("Building");
    return Scaffold(
      appBar: AppBar(title: Text("Xyz Screen"),),
      body: ListView.builder(
          itemCount: personProvider.length,
          itemBuilder: (context,index){
        return ListTile(
          title: Text("Name ${personProvider[index].name}"),
          subtitle: Text("Age ${personProvider[index].age}"),
          trailing: IconButton(onPressed: (){
            showDialogBox(personProvider[index]);
          }, icon: Icon(Icons.edit)),
        );
      }),
    );
  }

  void showDialogBox(Person person){
    final TextEditingController nameController = TextEditingController(text: person.name);
    final TextEditingController ageController = TextEditingController(text: person.age.toString());
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Edit"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name"
              ),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                  hintText: "Age"
              ),
            )
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
          TextButton(onPressed: (){
            ref.read(xyzProvider.notifier).changeName(nameController.text, person.id);
            ref.read(xyzProvider.notifier).changeAge(int.parse(ageController.text,), person.id);
            Navigator.pop(context);
          }, child: Text("Save"))
        ],
      );
    });
  }
}