// TODO Complete the file, main/bar.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique (based on
//      whether the user has logged in or not).
//      This includes:
//        [Done] a. The app bar shows 'unknown user' logo and the 'Login' button if
//           the user has not logged in yet.
//
//        [DONE] b. Otherwise (if the user has logged in), the app bar shows the user
//           photo and name, as well as the 'Logout' button.
//
//   2. Perform the following operations:
//        [DONE] a. Login  - This operation will navigate to the '/login' route.
//        [DONE] b. Logout - This will reset the 'user' state to 'null'.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'main_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  final MainScreenState _state;
  const Bar({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _state.user == null
          ? CircleAvatar(backgroundImage: AssetImage('assets/unknown_user.png'))
          : CircleAvatar(backgroundImage: NetworkImage(_state.user.photoUrl)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Todo List'),
          _state.user == null
              ? Text('unknown user', style: TextStyle(fontSize: 12.0))
              : Text(_state.user.name, style: TextStyle(fontSize: 12.0)),
        ],
      ),
      actions: [
        _state.user == null
            ? IconButton(
                icon: Icon(Icons.login),
                onPressed: () async {
                  _state.user = await Navigator.pushNamed(context, '/login');
                })
            : IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onPressed: () async {
                  _state.user = null;
                  _state.todos = null;
                })
      ],
    );
  }
}
