import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/todo.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference todolist= FirebaseFirestore.instance.collection("todo");

  Future updateUserData({required String task, required String description}) async{

    return await todolist.doc(uid).collection("mytodo").doc(task).set({
      'uid': uid,
      'task': task,
      'description': description,
    });
  }

  Future deletePost(String task) async {
    return await todolist.doc(uid).collection("mytodo").doc(task).delete();
  }
  
  List <ToDo> _todoListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return ToDo(description: (doc.data() as dynamic)['description'] ??'', task: (doc.data() as dynamic)['task'] ?? '', uid: (doc.data() as dynamic)['uid']);
    }).toList();
  }

  Stream<List<ToDo>?> get todo{
    return todolist.doc(uid).collection("mytodo").snapshots()
    .map(_todoListFromSnapshot);
  }

}