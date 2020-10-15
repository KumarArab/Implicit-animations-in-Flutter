import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Anim(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double opacity = 1.0;
  void changeMode() {
    print(opacity);
    setState(() {
      opacity = opacity == 1.0 ? 0.0 : 1.0;
    });
    print(opacity);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1470137430626-983a37b8ea46?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: opacity,
          child: Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1506606401543-2e73709cebb4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 130,
          child: Container(
            height: 50,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: FlatButton(
              onPressed: () => changeMode(),
              child: Text(
                "SWITCH",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class Boxer extends StatefulWidget {
  @override
  _BoxerState createState() => _BoxerState();
}

class _BoxerState extends State<Boxer> {
  Color color = Colors.red;
  double borderRadius = 1;
  double height = 100, width = 100, margin = 1;

  void change() {
    setState(() {
      color = randomColor();
      margin = randomMargin();
      borderRadius = randomBorderRadius();
      height = randomDimensions();
      width = randomDimensions();
    });
  }

  Color randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  double randomMargin() {
    return Random().nextDouble() * 64;
  }

  double randomBorderRadius() {
    return Random().nextDouble() * 64;
  }

  double randomDimensions() {
    return Random().nextDouble() * 400;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  height: height,
                  width: width,
                  margin: EdgeInsets.all(margin),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInExpo,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: color,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: FlatButton(
                onPressed: () => change(),
                child: Text(
                  "CHANGE",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 5,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class Anim extends StatefulWidget {
  @override
  _AnimState createState() => _AnimState();
}

class _AnimState extends State<Anim> {
  double ufoPosition = -420;
  double beamHeight = 0;
  double leftBeamPosition = 160;
  double topBeamPosition = 550;
  double topAlienPosition = 550;
  double leftAlienPosition = 200;
  double alienHeight = 0;
  bool isAlien = false;

  Future<void> changeBeamHeight() async {
    setState(() {
      leftBeamPosition = leftBeamPosition == 160 ? 105 : 160;
      topBeamPosition = topBeamPosition == 550 ? 500 : 550;
      beamHeight = beamHeight == 0 ? 500 : 0;
    });
    await Future.delayed(Duration(
      seconds: 1,
    ));
  }

  Future<void> moveAlien() async {
    setState(() {
      leftAlienPosition = leftAlienPosition == 200 ? 230 : 200;
      topAlienPosition = topAlienPosition == 550 ? 700 : 550;
      alienHeight = alienHeight == 0 ? 200 : 0;
    });
    await Future.delayed(Duration(
      seconds: 1,
    ));
  }

  Future<void> changeUfoPosition() async {
    setState(() {
      ufoPosition = ufoPosition == -420 ? -50 : -420;
    });
    await Future.delayed(Duration(
      seconds: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 30,
              top: 30,
              child: Image.asset(
                "assets/images/moon.png",
                height: 200,
              ),
            ),
            AnimatedPositioned(
              top: 300,
              left: ufoPosition,
              curve: Curves.easeInOutQuad,
              child: Image.asset(
                "assets/images/ufo.png",
                height: 300,
              ),
              duration: Duration(seconds: 2),
            ),
            AnimatedPositioned(
              top: topBeamPosition,
              left: leftBeamPosition,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(
                curve: Curves.decelerate,
                height: beamHeight,
                child: Image.asset(
                  "assets/images/beam.png",
                ),
                duration: Duration(seconds: 1),
              ),
            ),
            AnimatedPositioned(
              top: topAlienPosition,
              left: leftAlienPosition,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(
                curve: Curves.decelerate,
                height: alienHeight,
                child: Image.asset(
                  "assets/images/alien.png",
                ),
                duration: Duration(seconds: 1),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 130,
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: FlatButton(
                  onPressed: () {
                    if (isAlien) {
                      moveAlien().then((value) => changeBeamHeight()
                          .then((value) => changeUfoPosition()));
                      isAlien = false;
                    } else {
                      changeUfoPosition().then(
                        (value) =>
                            changeBeamHeight().then((value) => moveAlien()),
                      );
                      isAlien = true;
                    }
                  },
                  child: Text(
                    "ALIEN",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 5,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
