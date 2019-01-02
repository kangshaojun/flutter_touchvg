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


//    setLineWidth(40);
//    setLineColor(255,0,0,255);
  }

  //设置command
  Future<void> setCommand(String command) async {
    print('dart:command:' + command);
    await _channel.invokeMethod('setCommand',<String, dynamic>{'command': command});
  }

  //设置lineWidth
  Future<void> setLineWidth(int lineWidth) async {
    print('dart:setLineWidth:' + lineWidth.toString());
    await _channel.invokeMethod('setLineWidth',<String, dynamic>{'lineWidth': lineWidth});
  }

  //设置lineColor
  Future<void> setLineColor(int r, int g, int b,int a) async {
    await _channel.invokeMethod('setLineColor',<String, dynamic>{'r': r,'g': g,'b': b,'a': a});
  }

  //eraseView
  Future<void> eraseView() async {
    print('dart:eraseView:');
    await _channel.invokeMethod('eraseView');
  }

  //undo
  Future<void> undo() async {
    print('dart:undo:');
    await _channel.invokeMethod('undo');
  }

  //redo
  Future<void> redo() async {
    print('dart:redo:');
    await _channel.invokeMethod('redo');
  }



}

