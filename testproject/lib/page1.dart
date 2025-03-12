import 'package:flutter/material.dart';
import 'page2.dart'; // Import Page2 to navigate

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int textValue = 0; // Variable for textbox increment
  TextEditingController todoController = TextEditingController();
  List<String> todoList = [];

  void addTodoItem(String item) {
    setState(() {
      todoList.add(item);
    });
    todoController.clear();
  }

  void deleteTodoItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Image 1')),
                ElevatedButton(onPressed: () {}, child: Text('Image 2')),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Number increments',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              controller: TextEditingController(text: textValue.toString()),
              onTap: () {
                setState(() {
                  textValue++;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2()),
                );
              },
              child: Text('Go to Page 2'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: todoController,
              decoration: InputDecoration(
                labelText: 'Add To-Do Item',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String item = todoController.text;
                if (item.isNotEmpty) {
                  addTodoItem(item);
                }
              },
              child: Text('Add To-Do'),
            ),
            SizedBox(height: 20),
            if (todoList.isNotEmpty)
              Column(
                children: todoList
                    .asMap()
                    .map((index, item) {
                      return MapEntry(
                        index,
                        ListTile(
                          title: Text(item),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => deleteTodoItem(index),
                          ),
                        ),
                      );
                    })
                    .values
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
