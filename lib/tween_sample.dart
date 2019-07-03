
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TweenSampleHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TweenSample(),
    );
  }


}

class TweenSample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TweenStateAnimBuild();
  }
}


class TweenState extends State<TweenSample> with TickerProviderStateMixin{

  AnimationController animationController;

  Animation<double> animation;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    //过程
    final CurvedAnimation curve = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    
    animation = Tween<double>(begin: 0.0, end: 200.0).animate(curve)..addListener((){
      setState(() {

      });
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: animation.value,
        height: 200,
        child: Image.asset('assets/id_card_1.png'),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }


}

class TweenStateAnimBuild extends State<TweenSample> with TickerProviderStateMixin{

  AnimationController animationController;

  Animation<double> animation;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    //过程
    final CurvedAnimation curve = CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    animation = Tween<double>(begin: 0.0, end: 200.0).animate(curve);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: AnimatedBuilder(animation: animation, builder: (BuildContext context, Widget child){
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
      }, child: Image.asset('assets/id_card_1.png'),)
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }


}
