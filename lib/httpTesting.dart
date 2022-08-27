import 'dart:convert';

import 'package:expensetracker/Network.dart';
import 'package:flutter/material.dart';

class httpTesting extends StatefulWidget {
  const httpTesting({Key? key}) : super(key: key);

  @override
  State<httpTesting> createState() => _httpTestingState();
}

class _httpTestingState extends State<httpTesting> {
  myNetwork response = myNetwork();
  List<dynamic> data = [];
  @override
  void initState()
  {
    super.initState();
    getData();

    }
    Future<void> getData() async
    {
      data = jsonDecode(await response.getResult());
      print(data.length);

      setState((){});
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(itemCount: data.length,itemBuilder: (BuildContext context, int index){
          print("index ... $index");
          return ListTile(
            title: Text("banna"),
          );
        }),
        ),
      );

  }
}
