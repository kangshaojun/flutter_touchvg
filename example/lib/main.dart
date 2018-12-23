import 'package:flutter/material.dart';
import 'package:flutter_touchvg/flutter_touchvg.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TouchVGController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterTouchvg touchvg = new FlutterTouchvg(
      onTouchVGCreated: onTouchVGCreated,
    );

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter WhiteBoard'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: touchvg,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      IconData(61877, fontFamily: 'MaterialCommunityIcons'),
                      size: 32.0,
                    ),
                    onPressed: () {
                      setCommand("select");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      IconData(62443, fontFamily: 'MaterialCommunityIcons'),
                      color: Colors.blue,
                      size: 32.0,
                    ),
                    onPressed: () {
                      setCommand("splines");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      IconData(61848, fontFamily: 'MaterialCommunityIcons'),
                      size: 32.0,
                    ),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      IconData(61950, fontFamily: 'MaterialCommunityIcons'),
                      size: 32.0,
                    ),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      IconData(62554, fontFamily: 'MaterialCommunityIcons'),
                      size: 32.0,
                    ),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      IconData(62614, fontFamily: 'MaterialCommunityIcons'),
                      size: 32.0,
                    ),
                    onPressed: () {
                    },
                  ),


                ],
              ),
            ],
          )),
    );
  }

  void onTouchVGCreated(controller) {
    this.controller = controller;

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    platformVersion = await this.controller.platformVersion;
    print("platformVersion:::" + platformVersion.toString());
  }


  Future<void> setCommand(command) async {

    await this.controller.setCommand(command);
    
  }

}
