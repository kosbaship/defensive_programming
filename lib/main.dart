import 'package:flutter/material.dart';
import 'package:settings_screen/views/home_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Settings',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      );
}
