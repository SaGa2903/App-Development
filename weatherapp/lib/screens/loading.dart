import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  setupweather() async{

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    Location trial= Location();

    _serviceEnabled = await trial.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await trial.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await trial.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await trial.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }


    LocationData _locationData= await trial.getLocation();
    double? lat=(_locationData.latitude);
    double? lon=(_locationData.longitude);

    Response response= await get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=21f88bdb0b827f0657461aa74d92904f'));
    Map data= jsonDecode(response.body);
    print(data);

    int temp=0;
    int humidity=0;
    String icon='';
    String location=data['name'];
    int wind=0;
    String condn='';

    temp = data['main']['temp'].round() ;
    humidity= data['main']['humidity'];
    icon=data['weather'][0]['icon'];
    wind= data['wind']['speed'].round();
    condn=data['weather'][0]['main'];

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': location,
      'temp': temp,
      'humidity': humidity,
      'icon': icon,
      'wind':wind,
      'condn':condn,
    });
  }

  @override
  void initState() {
    super.initState();
    setupweather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[600],
        body: Center(
          child: SpinKitChasingDots(
            color: Colors.white,
            size: 80.0,
          ),
        )
    );
  }
}
