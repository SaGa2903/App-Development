import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
));



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  Widget button({required String text, required Color col}) {
    return Expanded(
      flex: 1,
      child: Container(
          color: col,
          //padding: EdgeInsets.all(20),
          child: TextButton(
              onPressed: (){
                buttonPressed(text);
              },
              child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              )
          )
      ),
    );
  }
  Widget button1({required String text, required Color col}) {
    return Expanded(
      flex: 1,
      child: Container(
          color: col,
          //padding: EdgeInsets.all(20),
          child: TextButton(
              onPressed: (){
                buttonPressed(text);
              },
              child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.deepOrange[700],
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  )
              )
          )
      ),
    );
  }

  double result=0;
  String display='';
  String display1='';
  String num1='0';
  String num2='0';
  String operator='';

  buttonPressed(String text) {
    setState(() {
    if (text=='+' || text=='-' || text=='×' || text=='÷') {
      if(operator=='+' || operator=='-' || operator=='×' || operator=='÷') {
        num2=display;
        if (operator == '+') result = double.parse(num1) + double.parse(num2);
        if (operator == '-') result = double.parse(num1) - double.parse(num2);
        if (operator == '×') result = double.parse(num1) * double.parse(num2);
        if (operator == '÷') {
          if (double.parse(num2) != 0)
            result = double.parse(num1) / double.parse(num2);
        }

        setState(() {

       display=result.toString();
       display1=num1+ " " + operator + " " + num2 + " = "+display; });
      }


        num1 = display;
        operator = text;
        display = '';
        //display1 = '';
        result = 0;
    }

    else if(text=='AC') {
      display='';
      display1='';
      num1='0';
      num2='0';
      operator='';
    }

    else if(text=='=') {
      num2 = display;

      if (operator == '+') result= double.parse(num1)+double.parse(num2);
      if (operator == '-') result= double.parse(num1)-double.parse(num2);
      if (operator == '×') result= double.parse(num1)*double.parse(num2);
      if (operator == '÷') {
        if (num2 != '0')
          result = double.parse(num1) / double.parse(num2);
      }
      display=result.toString();
      display1=num1+ " " + operator + " " +num2 + " = "+" "+display;
      num1='0';
      num2='0';
      operator='';

    }
    //if(text!="AC" && text!='+' && text!='-' && text!='×' && text!='÷' && text!='=')
    else {display += text; }
    //print(num1); print(num2);


    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            letterSpacing: 1,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        children: [Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text(
                                display1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ]
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        children: [Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text(
                                display,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ]
                      ),
                    ),
                  ],
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  button(text: "7", col: Colors.black87),
                  button(text: "8", col: Colors.black87),
                  button(text: "9", col: Colors.black87),
                  button1(text: "+", col: Colors.white),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  button(text: "4", col: Colors.black87),
                  button(text: "5", col: Colors.black87),
                  button(text: "6", col: Colors.black87),
                  button1(text: "-", col: Colors.white),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  button(text: "1", col: Colors.black87),
                  button(text: "2", col: Colors.black87),
                  button(text: "3", col: Colors.black87),
                  button1(text: "×", col: Colors.white),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  button(text: "AC", col: Colors.black87),
                  button(text: "0", col: Colors.black87),
                  button(text: ".", col: Colors.black87),
                  button1(text: "÷", col: Colors.white),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFFB33901),
                        Color(0xFFF67009),
                        Color(0xFFFFB74D),
                        Color(0xFFFFE516),
                      ],
                    ),
                  ),
                  //color: Colors.redAccent,
                  //padding: EdgeInsets.all(20),
                  child: TextButton(
                      onPressed: (){buttonPressed('=');},
                      child: Center(
                          child: Text(
                            '=',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              //fontWeight: FontWeight.bold,
                            ),
                          )))
              ),
            ),
          ]
      ),


    );
  }
}

