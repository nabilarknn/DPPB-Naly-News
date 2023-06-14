import 'package:cobadppb3/kategori.dart';
import 'package:cobadppb3/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0)),
      home: LoginApp(),
    );
  }
}
