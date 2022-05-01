// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  ValueNotifier<List<Map<String, String>>> todoItems = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoItems.value.add({
            'title': 'Todo ${todoItems.value.length}',
            'description':
                'This is a description for todo ${todoItems.value.length}',
          });
          // ignore: invalid_use_of_visible_for_testing_member
          todoItems.notifyListeners();
          print(todoItems.value);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: ValueListenableBuilder(
        valueListenable: todoItems,
        builder: (
          BuildContext context,
          List<Map<String, String>> value,
          Widget? child,
        ) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.android),
                title: Text(
                  'Item ${value[index]['title']}',
                  style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Colors.red) ??
                      Theme.of(context).textTheme.headline1,
                ),
                subtitle: Text('${value[index]['description']}'),
                trailing: IconButton(
                  onPressed: () {
                    todoItems.value.removeAt(index);
                    todoItems.notifyListeners();
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
