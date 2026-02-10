import 'package:bee/pages/home.dart';
import 'package:bee/pages/login.dart';
import 'package:bee/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(Context)=>const Login(),
      '/register':(Context)=>const Register(),
      '/home':(Context)=>const Home()
    },
  ));
}
