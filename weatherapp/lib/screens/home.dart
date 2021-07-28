import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {




  Map data={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(


                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[700],
                      shadowColor: Colors.black,
                      elevation: 0,
                      onSurface: Colors.blue,

                    ),


                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data= {
                          'humidity': result['humidity'],
                          'temp': result['temp'],
                          'location': result['location'],
                          'icon': result['icon'],
                          'condn': result['condn'],
                          'wind': result['wind'],
                        };
                      });
                    },

                    icon: Icon(
                      Icons.edit_location,
                    ),
                    label: Text('Edit Location'),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text('Today',
                  style: TextStyle(
                  backgroundColor: Colors.blue,
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                  ),
                ),
             SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${data['temp']}°',
                            style: TextStyle(
                              backgroundColor: Colors.blue,
                              color: Colors.white,
                              fontSize: 100,
                              letterSpacing: 2,
                              fontFamily: 'RobotoC',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('https://openweathermap.org/img/wn/${data['icon']}@2x.png'),
                                radius: 20,
                                backgroundColor: Colors.transparent,
                              ),
                              Text(
                                ' ${data['condn']}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    color: Colors.grey[50]
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image(
                                  image: AssetImage('assets/humidity1.png'),
                                ),
                                //backgroundImage: AssetImage('assets/humidity1.png'),
                                radius: 20,
                                backgroundColor: Colors.transparent,
                              ),
                              Text(
                                '  ${data['humidity']} %',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0,
                                    color: Colors.grey[50]
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/wind.png'),
                                radius: 20,
                                backgroundColor: Colors.transparent,
                              ),
                              Text(
                                ' ${data['wind']} km/hr',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    color: Colors.grey[50]
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.location_on,
                    color: Colors.grey[50],
                    size: 30,
                  ),
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                        color: Colors.grey[50]
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
