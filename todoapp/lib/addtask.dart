import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/database.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _taskKey = GlobalKey<FormState>();
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Form(
          key: _taskKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: TextFormField(
                      controller: taskController,
                      decoration: InputDecoration(
                        labelText: "Task",
                        hintText: "Enter a task",
                        enabledBorder: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a Task";
                        }
                        return null;
                      },
                    )
                ),

                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Enter a brief description",
                        enabledBorder: OutlineInputBorder(),
                      ),
                      // validator: (value){
                      //   if (value!.isEmpty){return "Enter User Name";}
                      //   return null;
                      // },
                    )
                ),

                ElevatedButton(
                    onPressed: () async{
                      await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).updateUserData(
                          task: taskController.text,
                          description: descriptionController.text,
                      );
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                    ),
                    child: Text("Add Task"),
                ),

              ],
            ),
          )),
    );
  }
}
