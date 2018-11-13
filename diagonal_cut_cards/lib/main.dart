import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double imageHeight, imageWidth;

  Widget _buildImage() {
    imageHeight = MediaQuery.of(context).size.height;
    imageWidth = MediaQuery.of(context).size.width;
    print(imageHeight);
    return ClipPath(
      clipper: DiagonalClipper(),
      child: GestureDetector(
        onTap: () {
          print('POS');
        },
        child: Container(
          height: imageHeight,
          width: imageWidth,
         
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xFFf953c6), Color(0xFFb91d73)],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
              )
                  // color: Colors.blue,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage2() {
    imageHeight = MediaQuery.of(context).size.height;
    imageWidth = MediaQuery.of(context).size.width;
    print(imageHeight);
    return ClipPath(
      clipper: DiagonalClipper2(),
      child: GestureDetector(
        onTap: () {
          print('SST');
        },
        child: Container(
          height: imageHeight,
          width: imageWidth,
          child: Card(
           child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xFF8E2DE2), Color(0xFFc4A00E0)],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
              )
                  // color: Colors.blue,
                  ),
            ),  
          ),
        ),
      ),
    );
  }

  Widget _buildCardText() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: imageHeight * 0.5 - 150.0, left: imageWidth * 0.5 - 50),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/retail.png',
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  'POS',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardTextSst() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: imageHeight * 0.5 - 10.0, left: imageWidth * 0.5 - 120),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Image.asset(
                  'assets/sales.png',
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 10.0,),
                Text(
                  'SST',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Stack(
          children: <Widget>[
            _buildImage(),
            _buildCardText(),
            _buildImage2(),
            _buildCardTextSst()
          ],
        ),
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0.0, size.height - 341.71);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class DiagonalClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
