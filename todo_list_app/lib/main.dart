import 'package:flutter/material.dart';
import 'todo.dart'; // Make sure this model class is defined properly

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key); // Updated constructor

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Todo> _todos = [];
  final TextEditingController _textFieldController = TextEditingController();

  void _addTodoItem(String title) {
    if (title.isNotEmpty) {
      setState(() {
        _todos.add(Todo(title: title));
        _textFieldController.clear();
      });
    }
  }

  Widget _buildTodoItem(Todo todo, int index) {
    return ListTile(
      title: Text(todo.title),
      leading: IconButton(
        icon: Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
        onPressed: () {
          setState(() {
            todo.isDone = !todo.isDone;
          });
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _todos.removeAt(index);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return _buildTodoItem(_todos[index], index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add Todo'),
                  content: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Enter todo here"),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('ADD'),
                      onPressed: () {
                        _addTodoItem(_textFieldController.text);
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('CANCEL'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}