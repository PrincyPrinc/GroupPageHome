import 'package:flutter/material.dart';
import 'colors.dart';
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Perform an action when the floating icon is pressed
            print('Floating icon pressed');
          },
          child: Icon(Icons.add),
          backgroundColor: textColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
