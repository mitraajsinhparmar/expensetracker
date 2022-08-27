  import 'package:googleapis/drive/v3.dart' as drive;
  import 'package:google_sign_in/google_sign_in.dart' as signIn;
  import 'package:flutter/material.dart';

  class apiDemo extends StatefulWidget {
    const apiDemo({Key? key}) : super(key: key);

    @override
    State<apiDemo> createState() => _apiDemoState();
  }

  class _apiDemoState extends State<apiDemo> {
    var banna;
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: ElevatedButton(onPressed: () async{
            final googleSignIn = signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
             final signIn.GoogleSignInAccount? account = await googleSignIn.signIn();
             banna = account;
            print("User account $account");
            setState((){});
          }, child: Text("banna"),), ),
        floatingActionButton: FloatingActionButton(onPressed: () {

        }, child: Text(banna.toString()),),
        ),

      );
    }
  }
