import 'dart:html';
//import 'dart:developer';
//import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:weatherapp/user.dart';

void main() {
  runApp( MaterialApp(
    home: HomePage(),
    routes: <String, WidgetBuilder> {
      "/currentweatherpage": (BuildContext context) => new CurrentWeatherPage()
    }
  ));
}





class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
  String username = "";
class HomePageState extends State<HomePage> {
  // This widget is the root of your application.

  final username_controller = TextEditingController();

    SharedPreferences logindata;
    bool newUser;
    @override
  void initState(){
    super.initState();
    getData();
  }

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
                controller: username_controller,
                decoration: new InputDecoration(
                  hintText: "Type in here!"
                ),
              
              ),
              RaisedButton(
                textColor: Colors.white, 
                color: Colors.blueGrey, 
                onPressed: () {
                  username = username_controller.text;

                  if (username != ""){
                    print("successful!");
                    logindata.setBool("login", false);

                    logindata.setString("username", username);
                    Navigator.of(context).pushNamed("/currentweatherpage");
                  }
                }
              )
            ]
          ),
        )
      ),
    );
  }
  getData () async{
    logindata = await SharedPreferences.getInstance();
    newUser = (logindata.getBool('login') ?? true);
    logindata = await SharedPreferences.getInstance();
    username = (logindata.getString('username'));

    print(newUser);
    print(username);
      if (newUser == false){
        Navigator.of(context).pushNamed("/currentweatherpage");
      }
    }
    @override
  void dispose(){
    username_controller.dispose();
    super.dispose();
  }
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
            greeting  + " " + username + "\n\n" + report + "\n\n\n Do ensure to take an umbrella out today. \n High possibility of rain fall.",
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