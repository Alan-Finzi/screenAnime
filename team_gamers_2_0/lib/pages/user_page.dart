import 'package:flutter/material.dart';
import 'package:team_gamers_2_0/mixPages/mix_user_page.dart';
import 'package:team_gamers_2_0/widgets/ScaffoldBody.dart';



class UserLoginPage extends StatelessWidget with PortraitModeMixin  {
    static final String routeName = 'user_login_page';
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: ScaffoldBody(
              scaffoldBody: _bodyChild(),
              key: Key('ScaffoldUser'),),
      );
  }


    Widget _bodyChild(){
        return Container(
            child: Center(child: Text('ESTA GIRA')),
        );
    }
}



