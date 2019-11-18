
import 'package:demo/NotificationPage.dart';
import 'package:demo/medicalRecord.dart';
import 'package:demo/medicalnotes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      routes: {
        "/MedicalNote": (BuildContext context) => MedicalNote(),
        "/MedicalRecord": (BuildContext context) => MedicalRecord(),
        "/NotificationPage":(BuildContext context)=>NotificationPage(),
      },
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new NotificationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
