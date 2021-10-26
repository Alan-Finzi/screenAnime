import 'package:flutter/material.dart';
import 'package:team_gamers_2_0/mixPages/mix_user_page.dart';
import 'package:team_gamers_2_0/widgets/ScaffoldBody.dart';

class SampleScreen extends StatefulWidget {
    static final String routeName = 'sample_page';
    SampleScreen() : super();

    @override
    State<StatefulWidget> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen>
    with PortraitStatefulModeMixin<SampleScreen> {
    @override
    Widget build(BuildContext context) {
        super.build(context);
        return   ScaffoldBody(
                scaffoldBody: Center(
                    child: Text("ESTA PAGE NO GIRA"),
                ),
                key: Key('ScaffoldUser'),
        );
    }


}