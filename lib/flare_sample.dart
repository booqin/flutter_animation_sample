import 'package:flutter/material.dart';
import 'package:nima/nima_actor.dart';
import "package:flare_flutter/flare_actor.dart";

/// Stand
/// Dance
/// Jump
/// Wave
/// flare可用，nima在子页面设置时会出现异常
/// The following NoSuchMethodError was thrown during a scheduler callback:
/// The method 'advance' was called on null.
class FlareHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("1111"),
//      ),
//      body: new FlareMainWidget(title: 'Flutter Demo Home Page'),
//    );
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(primarySwatch: Colors.blue),
//      home: FlareMainWidget(title: 'Flutter + Nima'),
//    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FlareMainWidget(title: 'Flutter Demo Home Page'),
    );
  }
}
//
//
//class FlareMainWidget extends StatefulWidget {
//  @override
//  _FlareMainState createState() => _FlareMainState();
//}
//
//class _FlareMainState extends State<FlareMainWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return  NimaActor('assets/robot.nima', alignment: Alignment.center,
//        fit: BoxFit.contain,
//        animation: "Flight",
//    );
//  }
//}


class FlareMainWidget extends StatefulWidget {
  FlareMainWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlareMainState createState() => new _FlareMainState();
}

class _FlareMainState extends State<FlareMainWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
        title: new Text("1111"),
    ),
    body: new FlareActor("assets/Bob (Minion).flr", alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "Stand",
    )
    );
  }
}
