
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import 'hero_widget.dart';

/// 三个页面转换
class HeroSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST"),
      ),
      body: new Center(
        child: PhotoHero(photo: "assets/id_card_1.png", width: 200, onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return Scaffold(
              appBar: AppBar( title: Text("NOP"),),
              body: Container(
                color: Colors.lightBlueAccent,
                alignment: Alignment.topLeft,
                child: PhotoHero(photo: "assets/id_card_1.png", width: 100, onTap: (){Navigator.pop(context);},),
              ),
            );
          }));
        }),
      ),
    );
  }
}


