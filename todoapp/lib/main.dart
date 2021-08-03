import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todoapp/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: SignUp(),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
