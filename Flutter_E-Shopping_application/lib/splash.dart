import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/home.dart';
import 'package:flutter_application_4/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late String name = "";
  late String pass = "";

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
        Duration(seconds: 10),
        (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    name == "" && pass == "" ? Login() : Home()))));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.blueGrey[600]),
        ),
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage('assets/shopping_ogo.png'),
                  fit: BoxFit.fill,
                )),
          ),
        ),
        Positioned(
          top: 500,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "\t\t\t“Sometimes the soul takes pictures of\n \t\t\tthings it has wished for, but never seen”",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent[400],
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "\t\t\t“A photograph shouldn't be just a picture\n \t\t\tit should be a philosophy.”",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent[400],
                        fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();

    name = prefs.getString('username')!;
    pass = prefs.getString('password')!;
    print(name);
  }
}
