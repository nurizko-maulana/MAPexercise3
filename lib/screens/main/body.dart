// TODO Complete the file, main/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with 'FutureBuilder' widget.
//      For todo items with the status has been 'done', they should be displayed
//      with the 'line through'. Otherwise, display it with normal text.
//
//   2. Perform the following operations:
//        a. Edit a todo - i.e., when the user tap a todo.
//           This operation will navigate to the '/edit' route.
//        b. Delete a todo - i.e. when the user long-press a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _state.todos != null ? _state.todos.length : 0,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => ListTile(
        title: Text(_state.todos[index].title,
            style: TextStyle(
                decoration: _state.todos[index].done == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none)),
        subtitle: Text(_state.todos[index].description),
        onTap: () {
          _state.updateTodo(index: index, todo: _state.todos[index]);
        },
        onLongPress: () {
          removeList(index);
        },
      ),
    );
  }

  void removeList(int index) {
    _state.removeTodo(index);
  }
}
