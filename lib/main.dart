import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layOut/home.dart';
import 'package:newsapp/screens/details_screen.dart';
import 'package:newsapp/splash_Screen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: splashScreen.routeName,
    routes:{
      HomeScreen.routeName:(context) => HomeScreen(),
      splashScreen.routeName:(context) => splashScreen(),
      DetailsScreen.routeName:(context) => DetailsScreen(),
    } ,
  ));
}