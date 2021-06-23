//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    home: HomePage(),
    routes: <String, WidgetBuilder> {
      "/currentweatherpage": (BuildContext context) => new CurrentWeatherPage()
    }
  ));
}
String name;
class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Home"), backgroundColor: Colors.blueGrey),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Please Enter Your Name", 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Type in here!"
                ),
              
              onSubmitted: (String str) {
                name = str;
                Navigator.of(context).pushNamed("/currentweatherpage");
                }
              )
            ]
          ),
        )
      ),
    );
  }
}


getData()async{
  //SharedPreferences preferences = await SharedPreferences.getInstance();
}

class CurrentWeatherPage extends StatefulWidget {


  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {

  String greeting;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    String report = "23°C   Light Rain";

    if(hour < 12){
      greeting = "Good Morning!";
      
    }
    else if(hour >= 12){
       if (hour < 16){
         greeting = "Good Afternoon!";
       }else{
         greeting = "Good Evening!";
       }
    }else{}
    
    return Scaffold(
      body: Stack(
      children: <Widget>[
        Image.asset('assets/morning.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Center(
          child: Center(child:
           Text (
            greeting  + " " + name + "                 "+"\n\n" + report + "\n\n\n Do ensure to take an umbrella out today. \n High possibility of rain fall.",
            textAlign: TextAlign.center,
            style: new TextStyle(fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.red),
            ),
          ),),
      ],
    ));  
  }
}

/*class SecondPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: <Widget>[
        Image.asset('assets/morning.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Center(
          child: Text("This is a Flutter Example",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.greenAccent)),
          ),
      ],
    ));  
  }
}*/

/*void main() {
  runApp(new MaterialApp(
    home: HomePage(),
    routes: <String, WidgetBuilder> {
      //"/": (BuildContext context) => new HomePage(),
      "/secondPage": (BuildContext context) => new SecondPage()
    }
  )
  );
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Home"), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.favorite, color: Colors.redAccent),
                iconSize: 70.0,
                onPressed: () {Navigator.of(context).pushNamed("/secondPage");}
              ),
              new Text("Home")
            ]
          ),
        )
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Second Page"), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.home, color: Colors.blue),
                iconSize: 70.0,
                onPressed: null,
              ),
              new Text("Second Page")
            ]
          ),
        )
      ),
    );
  }
}*/


