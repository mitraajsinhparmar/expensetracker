import 'package:flutter/material.dart';

class myClass extends StatefulWidget {
  const myClass({Key? key}) : super(key: key);

  @override
  State<myClass> createState() => _myClassState();
}

class _myClassState extends State<myClass> with SingleTickerProviderStateMixin {
 late AnimationController aniController;
  late Animation<Offset> animOffset;

  @override
  void initState()
  {
    print("called");
    super.initState();
    aniController = AnimationController(vsync: this, duration: Duration(seconds: 1) );
    animOffset = Tween<Offset>(
      begin: Offset(2.0,5.0),
      end: Offset(2.0,7.0),
    ).animate(aniController);
    aniController.repeat();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Center(child: ElevatedButton(onPressed: () {  }, child: Text("click me"),),),
            SlideTransition(position:  animOffset, child: Container(

              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
