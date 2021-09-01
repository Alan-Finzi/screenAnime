import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';

class PickFromURLView extends StatefulWidget {
    @override
    _PickFromURLViewState createState() => _PickFromURLViewState();
}

class _PickFromURLViewState extends State<PickFromURLView> {
    String _platformVersion = 'Unknown';

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

        setState(() {
            _platformVersion = platformVersion;
        });
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
                            const Text('Flutter 2 Airplay'),
                            Text(
                                _platformVersion,
                                style: TextStyle(fontSize: 12.0),
                            ),
                        ],
                    ),
                    leading: IconButton(
                        alignment: Alignment.centerLeft,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                        ),
                    ),
                    actions: [
                        AirPlayRoutePickerView(
                            tintColor: Colors.white,
                            activeTintColor: Colors.white,
                            backgroundColor: Colors.transparent,
                        ),
                    ],
                ),
                body: SafeArea(
                    child: Center(
                        child: FlutterAVPlayerView(urlString: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',),
                    ),
                ),
            ),
        );
    }
}