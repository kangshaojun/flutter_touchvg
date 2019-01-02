import 'package:flutter/material.dart';
import 'package:flutter_touchvg/flutter_touchvg.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TouchVGController controller;

  var _color = Colors.red;
  var _lineWidth = 16.0;
  var _tool = 'select';
  var _shape = 'splines';

  var rowHeight = 48.0;

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
        body: Stack(
          children: <Widget>[
            Container(
              child: touchvg,
            ),

            Positioned(
              bottom: rowHeight,
              left: 0.0,
              right: 0.0,
              child: //颜色及粗细
                  Offstage(
                offstage: _tool == 'property' ? false : true,
                child: Container(
                  height: rowHeight,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.only(
                      left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _color = Colors.red;
                          });
                          setLineColor(255,0,0,255);
                        },
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: _color == Colors.red
                                    ? Colors.white
                                    : Colors.black,
                                width: 1.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _color = Colors.blue;
                          });
                          setLineColor(0,0,255,255);
                        },
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: _color == Colors.blue
                                    ? Colors.white
                                    : Colors.black,
                                width: 1.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _color = Colors.green;
                          });
                          setLineColor(0,128,0,255);
                        },
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: _color == Colors.green
                                    ? Colors.white
                                    : Colors.black,
                                width: 1.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //粗细
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _lineWidth = 12.0;
                          });
                          setLineWidth(40);
                        },
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 1.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                  color: _lineWidth == 12.0
                                      ? Colors.yellow
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(6.0)),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _lineWidth = 16.0;
                          });
                          setLineWidth(60);
                        },
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 1.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                  color: _lineWidth == 16.0
                                      ? Colors.yellow
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _lineWidth = 20.0;
                          });
                          setLineWidth(80);
                        },
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 1.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                  color: _lineWidth == 20.0
                                      ? Colors.yellow
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //几何工具
            Positioned(
              bottom: rowHeight,
              left: 0.0,
              right: 0.0,
              child: Offstage(
                offstage: _tool == 'shape' ? false : true,
                child: Container(
                  height: rowHeight,
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
                          color: _shape == 'splines'
                              ? Color(0xffeaa815)
                              : Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {
                          setCommand("splines");
                          setState(() {
                            _shape = 'splines';
                          });
                        },
                      ),
                      //线
                      IconButton(
                        icon: Icon(
                          IconData(62814, fontFamily: 'MaterialCommunityIcons'),
                          size: 28.0,
                          color: _shape == 'line'
                              ? Color(0xffeaa815)
                              : Colors.white,
                        ),
                        onPressed: () {
                          setCommand('line');
                          setState(() {
                            _shape = 'line';
                          });
                        },
                      ),
                      //圆
                      IconButton(
                        icon: Icon(
                          IconData(63333, fontFamily: 'MaterialCommunityIcons'),
                          size: 28.0,
                          color: _shape == 'ellipse'
                              ? Color(0xffeaa815)
                              : Colors.white,
                        ),
                        onPressed: () {
                          setCommand("ellipse");
                          setState(() {
                            _shape = 'ellipse';
                          });
                        },
                      ),
                      //正方型
                      IconButton(
                        icon: Icon(
                          IconData(61858, fontFamily: 'MaterialCommunityIcons'),
                          size: 28.0,
                          color: _shape == 'rect'
                              ? Color(0xffeaa815)
                              : Colors.white,
                        ),
                        onPressed: () {
                          setCommand('rect');
                          setState(() {
                            _shape = 'rect';
                          });
                        },
                      ),
                      //三角型
                      IconButton(
                        icon: Icon(
                          IconData(62775, fontFamily: 'MaterialCommunityIcons'),
                          size: 28.0,
                          color: _shape == 'triangle'
                              ? Color(0xffeaa815)
                              : Colors.white,
                        ),
                        onPressed: () {
                          setCommand('triangle');
                          setState(() {
                            _shape = 'triangle';
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //底部工具
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: rowHeight,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                padding: const EdgeInsets.only(top: 4.0,bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        IconData(61877, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: _tool == 'select'
                            ? Color(0xffeaa815)
                            : Colors.white,
                      ),
                      onPressed: () {
                        setCommand("select");
                        setState(() {
                          _tool = 'select';
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(62443, fontFamily: 'MaterialCommunityIcons'),
                        color:
                            _tool == 'shape' ? Color(0xffeaa815) : Colors.white,
                        size: 28.0,
                      ),
                      onPressed: () {
                        setState(() {
                          _tool = 'shape';
                        });
                        //打开几何图形,设置当前shape
                        setCommand(_shape);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(61848, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color: _tool == 'property'
                            ? Color(0xffeaa815)
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _tool = 'property';
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(61950, fontFamily: 'MaterialCommunityIcons'),
                        size: 28.0,
                        color:
                            _tool == 'erase' ? Color(0xffeaa815) : Colors.white,
                      ),
                      onPressed: () {
                        setCommand("erase");
                        setState(() {
                          _tool = 'erase';
                        });
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
                        setState(() {
                          _tool = 'undo';
                        });
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
                        setState(() {
                          _tool = 'redo';
                        });
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
                        setState(() {
                          _tool = 'deleteall';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTouchVGCreated(controller) {
    this.controller = controller;

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

//    platformVersion = await this.controller.platformVersion;
//    print("platformVersion:::" + platformVersion.toString());
  }

  Future<void> setCommand(command) async {
    await this.controller.setCommand(command);
  }

  //设置线宽
  Future<void> setLineWidth(lineWidth) async {
    await this.controller.setLineWidth(lineWidth);
  }

  //设置线宽
  Future<void> setLineColor(int r, int g, int b,int a) async {
    await this.controller.setLineColor(r, g, b, a);
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
