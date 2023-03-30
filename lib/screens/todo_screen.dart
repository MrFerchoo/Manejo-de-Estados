import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todoList = [];

  void _addItem(String item) {
    setState(() {
      _todoList.add(item);
    });
  }

  void _removeItem(String item) {
    setState(() {
      _todoList.remove(item);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (context, int index) {

        final todoItem = _todoList[index];

        return ListTile(
          title: Text(todoItem),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _removeItem(todoItem),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To list App"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Agregue una nueva tarea"
            ),
            onSubmitted: (value){
              _addItem(value);
            }),
            Expanded(child: _buildTodoList())
        ],
      ),
    );
  }
}
