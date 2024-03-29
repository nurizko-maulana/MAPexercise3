// TODO Complete the file edit_screen.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//
//   1. Build the UI by composing from its components, i.e., Bar and Body.
//      Besides, you will also need to pass the 'states' to the components.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:exercise3/screens/edit/bar.dart';
import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'body.dart';

class EditScreen extends StatefulWidget {
  static Route route({isEditing = true, Todo data}) => MaterialPageRoute(
      builder: (context) => EditScreen(isEditing: isEditing, data: data));

  final bool _isEditing;
  final Todo _data;

  get isEditing => _isEditing;

  get data => _data;
  EditScreen({isEditing, data})
      : _isEditing = isEditing,
        _data = data;

  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  Todo _newTodo = Todo();

  get isEditing => widget._isEditing;
  get data => widget._data;
  get newTodo => _newTodo;
  set newTodo(value) => _newTodo = value;

  set setTitle(value) => _newTodo.title = value;
  set setDescription(value) => _newTodo.description = value;
  get done => _newTodo.done;
  set setDone(value) {
    setState(() {
      _newTodo.done = value;
      print("done tapped");
    });
  }

  @override
  void initState() {
    _newTodo = data;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(state: this),
          body: Body(state: this),
        ),
      ),
    );
  }
}
