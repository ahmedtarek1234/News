import 'package:flutter/material.dart';
import 'package:newsapp/layOut/home.dart';

class splashScreen extends StatefulWidget {
  static const String routeName="splashScreen";

  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0XFFDFECDB),
        child: Center(
          child: Container(
            height: 195,
            width: 220,
            decoration: BoxDecoration(
              image: DecorationImage(

                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
