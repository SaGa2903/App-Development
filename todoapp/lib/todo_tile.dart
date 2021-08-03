import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/database.dart';
import 'package:todoapp/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoTile extends StatelessWidget {
  //const TodoTile({Key? key}) : super(key: key);
  String? uid='';

  ToDo? todo= ToDo(description: '', task: '', uid:'' );
  TodoTile({this.todo,this.uid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        //margin: EdgeInsets.all(8),
        child: ListTile(
          trailing: IconButton(
            onPressed: () async {await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).deletePost('${todo!.task}');},
            icon: Icon(Icons.delete),
          ),
          title: Text('${todo!.task}'),
          subtitle: Text('${todo!.description}'),
        ),
      ),
    );
  }
}
