import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 500.0, end: -90.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

//       animation.addStatusListener((status){
// if(status==AnimationStatus.completed){
//   controller.reverse();
// }else if(status==AnimationStatus.dismissed){

// }
      // });
    controller.repeat();
  }

  Widget build(BuildContext context) {
        final Matrix4 transform = new Matrix4.rotationY(180*1.0);

    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10.0),
      // height: animation.value,
      // width: animation.value,
      // child: FlutterLogo(),

      color: Colors.white,
      child: Stack(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Positioned(
            child: Material(
              child: Transform(
                transform:transform ,
                child: Icon(
                  Icons.airport_shuttle,
                  size: 80.0,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            left: animation.value,
            top: 180.0,
          ),
        ],
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(LogoApp());
}
