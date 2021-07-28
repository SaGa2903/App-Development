import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  Future <void> updateWeather(text) async{
    Weather instance= Weather(location: input.text, url: '');
    await instance.getWeather();

    Navigator.pop(context, {
      'location': instance.location,
      'temp': instance.temp,
      'humidity': instance.humidity,
      'icon': instance.icon,
      'wind':instance.wind,
      'condn':instance.condn,
    });
  }

  final TextEditingController input= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Text(
          'Choose Location',
          style: TextStyle(
              fontSize:24 ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            // padding: EdgeInsets.symmetric(vertical: 90, horizontal: 50),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: TextField(
              controller: input,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Enter a Location',
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.amber,),
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black,
                )
              ),

            ),
          ),
          ElevatedButton(

              onPressed: (){updateWeather(input.text);},
              child: Text(
                'Submit',
              ),
          ),
        ],
      ),

    );
  }
}
