import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/todo.dart';
import 'todo_tile.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  String? uid= FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final todo= Provider.of<List<ToDo>?>(context);
    // todo!.forEach((element) {
    //   print(element.task);
    //   print(element.description);
    // });
    // print(todo);
    // for(var doc in todo!.docs){
    //   print(doc.data());
    // }
    return todo==null ? Container() : ListView.builder(
      itemCount: todo.length,
      itemBuilder: (context,index) {
        return TodoTile(todo: todo[index], uid: uid,);
      },


    );
  }
}
