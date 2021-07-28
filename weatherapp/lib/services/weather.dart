import 'package:http/http.dart';
import 'dart:convert';

class Weather{
  String location='Delhi';
  String url='';
  int temp=0;
  int humidity=0;
  String icon='';
  int wind=0;
  String condn='';


  Weather({required this.location, required this.url});


  getWeather() async {
    Response response = await get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=21f88bdb0b827f0657461aa74d92904f'));
    Map data = jsonDecode(response.body);
    //print(response.body);
     print(data);
    // print(data['weather']);
    // print(data['main']);

    temp= data['main']['temp'].round() ;
    humidity= data['main']['humidity'];
    icon=data['weather'][0]['icon'];
    wind= data['wind']['speed'].round();
    condn=data['weather'][0]['main'];

    // print(temp);
    // print(humidity);
    // print(data['weather'][1]);
    // print(icon);
    print(wind);
    print(condn);

  }

  // getWeather() async {
  //   Response response = await get(Uri.http(
  //       'api.openweathermap.org','/data/2.5/weather?q=London&appid=21f88bdb0b827f0657461aa74d92904f', {'q': '{http}'}));
  //   // Map data = jsonDecode(response.body);
  //   print(response.body);
  //   // print(data);
  // }
  //
  // getWeather() async {
  //   Response response = await get(Uri.http(
  //       'dataservice.accuweather.com','/locations/v1/cities/autocomplete?apikey=%09tlez51G4wwFvCsgBaAGKObGBZ1GCyfDL&q=Mumbai', {'q': '{http}'}));
  //   // List data = jsonDecode(response.body).toList();
  //   Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(response.body));
  //   // print(response.body);
  //   print(data);
  // }
  //
  // getWeather() async {
  //   Response response = await get(Uri.http(
  //       "dataservice.accuweather.com","/currentconditions/v1/204842?apikey=%09tlez51G4wwFvCsgBaAGKObGBZ1GCyfDL", {'q': '{http}'}));
  //    Map data = jsonDecode(response.body);
  //   print(response.body);
  //   print(data);
  // }
  //
  // getWeather() async {
  //   Response response = await get(Uri.http(
  //       'api.weatherapi.com','/v1/current.json?key=d64582e74ed94c4794c195518212407&q=Mumbai&aqi=no', {'q': '{http}'}));
  //   // Map data = jsonDecode(response.body);
  //   print(response.body);
  //   // print(data);
  // }



 }