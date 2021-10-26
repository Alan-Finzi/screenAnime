import 'package:flutter/material.dart';


class AlertNoInternetConnection extends StatelessWidget {
    const AlertNoInternetConnection({required Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Positioned(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 50.0,
                    color: Colors.orangeAccent,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text("Parece que no hay internet", style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                    )
                )
            ),
        );
    }
}