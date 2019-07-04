
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';

///包裹的展示核心类
class Photo extends StatelessWidget {

  final VoidCallback onTap;
  final String photo;
  final Color color;

  const Photo({Key key, this.onTap, this.photo, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints size){
          return Image.asset(photo, fit: BoxFit.contain,);
        }),
      ),
    );
  }
}

/// 动效支持类
class RadialExpansion extends StatelessWidget {
  
  final double maxRadius;
  final Widget child;
  final clipRectSize;

  const RadialExpansion({Key key, this.maxRadius, this.child}) : clipRectSize=2.0*(maxRadius/math.sqrt2), super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}


class HeroRadialHome extends StatelessWidget {

  static const double minRadius = 32.0;
  static const double maxRadius = 132.0;
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(title: Text("HeroRadial")),
      body: Container(
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHero(context, 'assets/id_card_1.png')
          ],
        ),
      ),
    );
  }

  /// 共享元素容器类
  Widget _buildHero(BuildContext context, String imageName){
    return Container(
      width: minRadius * 2,
      height: minRadius *2,
      child: Hero(
        createRectTween: (begin, end){
          return MaterialRectArcTween(begin: begin, end: end);
        },
        tag: imageName,
        child: RadialExpansion(
          maxRadius: maxRadius,
          child: Photo(
            photo: imageName,
            onTap: (){
//              Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
//                return TargetHeroRadial();
//              }));
              Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child){
                    return Opacity(
                      opacity: opacityCurve.transform(animation.value),
                      child: TargetHeroRadial(),
                    );
                  },
                );
              }));
            },
          ),
        ),
      )
    );
  }

}

class TargetHeroRadial extends StatelessWidget {
  static const double maxRadius = 138.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Target"),),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: maxRadius * 2,
              height: maxRadius * 2,
              child: Hero(tag: 'assets/id_card_1.png',
                  createRectTween: (begin, end){
                    return MaterialRectArcTween(begin: begin, end: end);
                  },
                  child: RadialExpansion(
                    maxRadius: maxRadius,
                    child: Photo(
                        photo: 'assets/id_card_1.png',
                        onTap: (){
                          Navigator.pop(context);
                        }
                        ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}







