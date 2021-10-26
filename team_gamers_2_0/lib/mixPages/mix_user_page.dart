import 'package:flutter/cupertino.Dart';
import 'package:flutter/services.Dart';

mixin PortraitModeMixin on StatelessWidget {
    @override
    Widget build(BuildContext context) {
        _portraitModeOnly();
        return Container();
    }
}

mixin PortraitStatefulModeMixin<T extends StatefulWidget> on State<T> {
    @override
    Widget build(BuildContext context) {
        _portraitModeOnly();
        return Container();
    }

    @override
    void dispose() {
        _enableRotation();
    }
}

/// blocks rotation; sets orientation to: portrait
void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
    ]);
}

void _enableRotation() {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
    ]);
}