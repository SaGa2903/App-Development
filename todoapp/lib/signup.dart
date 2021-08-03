import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/database.dart';
import 'package:todoapp/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isRegistered=true;

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isRegistered? Text('Sign Up'): Text('Login'),
      ),
      body: Form(
        key: !isRegistered? _formKey:_formKey1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                !isRegistered ? Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      hintText: "Enter Your Name",
                      enabledBorder: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if (value!.isEmpty){return "Enter User Name";}
                      return null;
                    },
                  ),
                ): Container(
                  height: 0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Your Email",
                      enabledBorder: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if (value!.isEmpty) {
                        return 'Enter an Email Address';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      enabledBorder: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value){
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      } else if (value.length < 6) {
                        return 'Password must be atleast 6 characters!';
                      }
                      return null;
                    },
                  ),
                ),

                ElevatedButton(
                    onPressed:!isRegistered ?  (){
                      if (_formKey.currentState!.validate()) {
                        registerToFb();
                      }
                    } : (){
                      if (_formKey1.currentState!.validate()) {
                        logInToFb();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                    ),
                    child: !isRegistered ? Text('Sign Up'): Text('Login')
                ),

                TextButton(
                    onPressed: (){
                      setState(() {
                        isRegistered = !isRegistered;
                      });
                    },
                    child: !isRegistered ? Text('Already Registered?'): Text('Not a user? Sign Up Now!')
                )



              ],
            ),
          )
      ),
    );
  }
  void registerToFb() async{
    firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text
    )
        .then((result) {
          //DatabaseService(uid: result.user!.uid).updateUserData(task: 'Create your first task', description: 'add new task from below');
      dbRef.child(result.user!.uid).set({
        "email": emailController.text,
        "name": nameController.text,
      }).then((res) {
        isRegistered=true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(uid: result.user!.uid)),
        );
      });
    }).catchError((err){
      showDialog(
          context: context,
          builder:(BuildContext context){
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"),
                )
              ],
            );
          }
      );
    });
    }
    void logInToFb() {
    firebaseAuth
        .signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text
    )
        .then((result) {
        isRegistered=true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(uid: result.user!.uid)),
        );
    }).catchError((err){
      showDialog(
          context: context,
          builder:(BuildContext context){
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"),
                )
              ],
            );
          }
      );
    });
    }


  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}




