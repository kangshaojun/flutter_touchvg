import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

typedef void TouchVGCreatedCallback(TouchVGController controller);

class FlutterTouchvg extends StatefulWidget {

  final TouchVGCreatedCallback onTouchVGCreated;

  FlutterTouchvg({Key key, @required this.onTouchVGCreated,});

  @override
  _FlutterTouchvgState createState() => _FlutterTouchvgState();
}

class _FlutterTouchvgState extends State<FlutterTouchvg> {
  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'flutter_touchvg',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if(defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'flutter_touchvg',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  Future<void> onPlatformViewCreated(id) async {
    if (widget.onTouchVGCreated == null) {
      return;
    }
    widget.onTouchVGCreated(new TouchVGController.init(id));
  }

}


class TouchVGController {

  MethodChannel _channel;

  TouchVGController.init(int id) {
    _channel =  new MethodChannel('flutter_touchvg_$id');
  }

  Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //设置command
  Future<void> setCommand(String command) async {
    print('dart:command:' + command);
    await _channel.invokeMethod('setCommand',<String, dynamic>{'command': command});
  }


}

