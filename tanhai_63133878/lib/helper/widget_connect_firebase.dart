import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

class MyFirebaseConnect extends StatefulWidget {
  final String errorMessage;
  final String connectingMessage;
  final Widget Function(BuildContext context) builder;
  const MyFirebaseConnect({Key? key,
    required this.errorMessage,
    required this.connectingMessage,
    required this.builder}) : super(key:key);

  @override
  State<MyFirebaseConnect> createState() => _MyFirebaseState();
}

class _MyFirebaseState extends State<MyFirebaseConnect> {
  bool ketnoi = false;
  bool loi = false;

  @override
  Widget build(BuildContext context) {
    if(loi == true)
    {
      return
        Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text(widget.connectingMessage, style: TextStyle(fontSize: 16),
                  textDirection: TextDirection.ltr,),
              ],
            ),
          ),
        );
    }
    else
    {
      if(ketnoi == false)
      {
        return
          Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(widget.connectingMessage, style: TextStyle(fontSize: 16),
                    textDirection: TextDirection.ltr,),
                ],
              ),
            ),
          );
      }
      else
      {
        return widget.builder(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _khoitaoFirebase();
  }

  _khoitaoFirebase(){
    Firebase.initializeApp(options: DefaultFirebaseOptions
        .currentPlatform).then(
            (value) {
          setState(() {
            ketnoi = true;
          });
        }
    ).catchError((error){
      setState(() {
        loi = true;
      });
    }).whenComplete(() {
      print("Kết thúc việc khởi tạo Firebase");
    });
  }

  _test(){
    if(loi == true){

    }else{
      if(ketnoi == false){

      }else{

      }
    }
  }
}