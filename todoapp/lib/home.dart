import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/addtask.dart';
import 'package:todoapp/todo.dart';
import 'package:todoapp/todo_list.dart';
import 'signup.dart';
import 'package:todoapp/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  Home({required this.uid});
  String uid='';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ToDo>?>.value(
      //catchError: null,
      value: DatabaseService(uid: widget.uid).todo,
      initialData: null,
      builder: (context,scaffold){
        return Scaffold(
            appBar: AppBar(
              title: Text("Home"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onPressed: () async{
                    FirebaseAuth auth = FirebaseAuth.instance;
                    await auth.signOut().then((res) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                              (Route<dynamic> route) => false);
                    });
                  },
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async{
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTask()
                    )
                );
                setState(() {
                });

              },
            ),
            body: ToDoList(),
          //Center(child: Text('Welcome! $uid'))
        );
  },
    );
        //drawer: NavigateDrawer(uid: this.uid));
  }
}
