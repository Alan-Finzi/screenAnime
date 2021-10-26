import 'package:flutter/material.dart';
import 'package:team_gamers_2_0/mixPages/mix_user_page.dart';
import 'package:team_gamers_2_0/widgets/ScaffoldBody.dart';

class HomePage extends StatelessWidget with PortraitModeMixin  {
    static final String routeName = 'home_page';
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
            child: Center(child: Text('Solucion a giro de pantalla, Cambia la PAGE!!')),
        );
    }
}

