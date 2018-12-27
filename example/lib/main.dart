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
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //画笔
                    IconButton(
                      icon: Icon(
                        IconData(62443, fontFamily: 'MaterialCommunityIcons'),
                        color: const Color(0xffeaa815),
                        size: 28.0,
                      ),
                      onPressed: () {
                        setCommand("splines");
                      },
                    ),
                    //线
                    IconButton(
                      icon: Icon(
                        IconData(62814, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setCommand('line');
                      },
                    ),
                    //圆
                    IconButton(
                      icon: Icon(
                        IconData(63333, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,

                      ),
                      onPressed: () {
                        setCommand("ellipse");
                      },
                    ),
                    //正方型
                    IconButton(
                      icon: Icon(
                        IconData(61858, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setCommand('rect');
                      },
                    ),
                    //三角型
                    IconButton(
                      icon: Icon(
                        IconData(62775, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setCommand('triangle');
                      },
                    ),
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        IconData(61877, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setCommand("select");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(62443, fontFamily: 'MaterialCommunityIcons'),
                        color: const Color(0xffeaa815),
                        size: 28.0,
                      ),
                      onPressed: () {
                        setCommand("splines");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(61848, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(61950, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,

                      ),
                      onPressed: () {
                        setCommand("erase");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(62554, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        undo();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(62614, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        redo();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(61888, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        eraseView();
                      },
                    ),
                  ],
                ),
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

  //eraser method
  Future<void> eraseView() async {

    await this.controller.eraseView();

  }

  //undo method
  Future<void> undo() async {
    await this.controller.undo();
  }

  //redo method
  Future<void> redo() async {
    await this.controller.redo();
  }

}
