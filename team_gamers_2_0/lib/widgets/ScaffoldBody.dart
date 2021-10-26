import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:team_gamers_2_0/widgets/text_scale_factor_clamper.dart';
import 'alert_no_internet_connection.dart';

class ScaffoldBody extends StatefulWidget {
    final Widget scaffoldBody;
    ScaffoldBody({required Key key, required this.scaffoldBody}) : super(key: key);
    _ScaffoldBodyState createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
    bool connectionLost = false;

    @override
    void initState() {
        Connectivity().onConnectivityChanged.listen((
            ConnectivityResult result) {
            if (result == ConnectivityResult.none) {
                setState(() {connectionLost = true;});
            } else {
                setState(() {connectionLost = false;});
            }

        });

        Connectivity().checkConnectivity().then((ConnectivityResult result) {
            if (result == ConnectivityResult.none) {
                setState(() {connectionLost = true;});
            }
        });

        super.initState();
    }


    @override
    Widget build(BuildContext context) {
        return TextScaleFactorClamper(
            child: Stack(
                children: <Widget>[
                    widget.scaffoldBody,
                    connectionLost ? AlertNoInternetConnection(
                        key: Key('alertNoInternet'),) : Container()
                ],
            ),
        );
    }
}