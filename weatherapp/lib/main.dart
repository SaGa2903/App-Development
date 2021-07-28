import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/loading.dart';
import 'screens/choose_location.dart';

void main() {runApp(MaterialApp(
  theme: ThemeData(
    fontFamily: 'Poppins',
  ),
  initialRoute: '/',
  routes: {
    '/' : (context)=> Loading(),
    '/home': (context)=> Home(),
    '/location': (context)=> ChooseLocation(),
  },

)
);
}