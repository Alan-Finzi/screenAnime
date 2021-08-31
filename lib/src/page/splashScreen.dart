import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screen/src/page/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:15), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(title: 'cruce de campeones')));
    });
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 100.0,
            ),
        ),
    );
  }
}
