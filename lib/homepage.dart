// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int todoCount = 0;
  List<Map<String, String>> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoItems.add({
            'title': 'Todo ${todoItems.length}',
            'description': 'This is a description for todo ${todoItems.length}',
          });
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.android),
            title: Text('Item ${todoItems[index]['title']}'),
            subtitle: Text('${todoItems[index]['description']}'),
            trailing: IconButton(
              onPressed: () {
                todoItems.removeAt(index);
                setState(() {});
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
