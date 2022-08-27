import 'package:flutter/material.dart';
class appbarexample extends StatefulWidget {
  const appbarexample({Key? key}) : super(key: key);

  @override
  State<appbarexample> createState() => _appbarexampleState();
}

class _appbarexampleState extends State<appbarexample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("bannaji"),
        ),
        body: Center(
          child: Text("banna"),
        ),
      ),
    );
  }
}
