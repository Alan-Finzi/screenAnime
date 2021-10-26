import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:team_gamers_2_0/pages/home_page.dart';
import 'package:team_gamers_2_0/pages/sample_page.dart';
import 'package:team_gamers_2_0/pages/user_page.dart';
import 'package:team_gamers_2_0/widgets/alert_no_internet_connection.dart';
import 'package:team_gamers_2_0/widgets/team_widgets.dart';

void main() => runApp(
    MaterialApp(
        home: BottomNavBar(),
        debugShowCheckedModeBanner: false,
    )
);


class BottomNavBar extends StatefulWidget  {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
    bool connectionLost = false;
    int _selectedIndex = 0;
    void _handleIndexSelectedPage(int newValue) {
        setState(() {_selectedIndex = newValue;});
    }
    @override
    void initState(){
        Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
            if (result == ConnectivityResult.none){
                connectionLost = true;
            } else {
                connectionLost = false;
            }
            setState(() {});

        });

        Connectivity().checkConnectivity().then((ConnectivityResult result){
            if (result == ConnectivityResult.none){
                connectionLost = true;
                setState(() {});
            }
        });

        super.initState();
    }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:  PaymunBottomNavigationBar(indexSelectedPage: _handleIndexSelectedPage, currentIndex: _selectedIndex,key: Key("Buttomnavigation"),),
        body: _scaffoldBodyStack(),
    );
  }


    Widget _scaffoldBodyStack(){
        return Stack(
            children: <Widget>[
                 selectPage(_selectedIndex),
                connectionLost ? AlertNoInternetConnection(key: Key('AlertNoInternetMain'),) : Container(),
            ],
        );
    }


    Widget selectPage(int index){
        switch (index) {
            case 0: return HomePage(); break;
            case 1: return UserLoginPage(); break;
            case 2: return SampleScreen(); break;
            case 3: return SampleScreen(); break;
            case 4: return UserLoginPage(); break;
            default: return Container(); break;
        }
    }


}