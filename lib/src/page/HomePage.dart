import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_screen/src/page/pick_from_url_view.dart';
import 'package:flutter_screen/src/widget/custom_icon_view.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';



class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    String _platformVersion = 'no se encontro ios';

    @override
    void initState() {
        super.initState();
        initPlatformState();
    }

    // Platform messages are asynchronous, so we initialize in an async method.
    Future<void> initPlatformState() async {
        String platformVersion;
        // Platform messages may fail, so we use a try/catch PlatformException.
        try {
            platformVersion = await FlutterToAirplay.platformVersion;
        } on PlatformException {
            platformVersion = 'Failed to get platform version.';
        }

        if (!mounted) return;

        setState(() {_platformVersion = platformVersion;});
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                appBar: AppBar(
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            const Text('Test apple tv'),
                            Text(
                                _platformVersion,
                                style: TextStyle(fontSize: 12.0),
                            ),
                        ],
                    ),
                ),
                body: SafeArea(
                    child: Container(
                        // height: MediaQuery.of(context).size.height,
                        // width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                                switch (index) {
                                    case 1:
                                        return ListTile(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => PickFromURLView(),
                                                ),
                                            ),
                                            title: Text('Video from URL PARA IOS'),
                                            trailing: Icon(Icons.chevron_right),
                                        );
                                        break;
                                    case 2:
                                        return ListTile(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => CustomIconView(),
                                                ),
                                            ),
                                            title: Text('Custom Icon PARA IOS'),
                                            trailing: Icon(Icons.chevron_right),
                                        );
                                        break;
                                    default:
                                        return Container();
                                }
                            },
                        ),
                    ),
                ),
            ),
        );
    }
}