import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/Screens/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Splash_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}






