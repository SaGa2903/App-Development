import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
//import 'qnans.dart';
import 'questions.dart';

void main() {
  runApp(Phoenix(child: MyApp()));
}


class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oto',
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int qindex=0;
  bool isAnswered=true;
  bool isAns=true;
  List <Widget> ans_icon=[];

  Widget icon_correct(){
    return Container(
      width: MediaQuery.of(context).size.width*0.1,
      child: Icon(
        Icons.check_circle_outline_outlined,
        size: 30,
        color: Colors.green,
      ),
    );
  }

  Widget icon_wrong(){
    return Container(
      width: MediaQuery.of(context).size.width*0.1,
      child: Icon(
        Icons.radio_button_checked_rounded,
        size: 30,
        color: Colors.redAccent,
      ),
    );
  }

  Widget _ansrow(){

    return Row(
      children: ans_icon,
    );
  }

  press_true(){

      setState(() {
        isAnswered = true;
        isAns = isAnswered == q_ans[qindex%10].ans;
        qindex++;

        if (isAns) {
          ans_icon.add(icon_correct());
        }
        else {
          ans_icon.add(icon_wrong());
        }

        // if(qindex>9) {
        //   qindex=0;
        //   ans_icon.clear();
        // }
      });

  }

press_false(){

    setState((){
      isAnswered=false;
      isAns= isAnswered==q_ans[qindex%10].ans;
      qindex++;
      print(qindex);


       if(isAns) {ans_icon.add(icon_correct());}
       else {ans_icon.add(icon_wrong());}

       // if(qindex>9) {
       //
       //   qindex=0;
       //   ans_icon.clear();
       //  }
    });

  }

  @override
  void setState(VoidCallback fn){
    if(qindex>9) {

      qindex=0;
      ans_icon.clear();
    }
    // TODO: implement setState
    super.setState(fn);
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFF01A7E8),
            Color(0xFF0AEEEE),
            Color(0xFF98FFED),
            Color(0xFFB2FAFD),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white60,
          actions: [
            IconButton(
                onPressed: (){Phoenix.rebirth(context);}
            , icon: Icon(
              Icons.replay_rounded,
              size: 30,

            )
            )
          ],
          title: Text(
          'QUIZ TIME!',
            style: TextStyle(
          color: Colors.white,
          fontSize: 24
            ),
          ),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            q_ans[qindex%10].ques,
                            // 'Loripsum dolor sit amet, consectetur adipisicing elit, '
                            //     'sed do eiusmod tempor incididunt ut'
                            //     ' labore et dolore magna aliqua.',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0xDD383737),
                              fontSize: 21,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.white70,
                      ),
                      child: TextButton(
                        onPressed:() => press_true(),
                        child: Text(
                          'True',
                          style: TextStyle(
                              color: Color(0xFFFFA53A),
                              fontSize: 20,
                          ),
                        ),
                      ),
                    ),

              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Colors.white70,
                ),
                child: TextButton(
                  onPressed: (){
                    press_false();
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Color(0xFFFFA53A),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                  child: _ansrow(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
