import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(),
        home: HP(title: 'Logbook'),
      );
}

class S extends StatefulWidget {
  State createState() => null;
}

class HP extends S {
  HP({Key key, this.title});
  final String title;
  createState() => _HPS();
}

class _HPS extends State<HP> {
  PageController _pageController;
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    _pageController = PageController(initialPage: 0, viewportFraction: 233/width);
    return Scaffold(
      body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Container(
                  width: 233,
                  height: 480,
                  color: Colors.black87,
                ),
              ),
              Container(
                height: 464,
                child: PageView(
                  controller: _pageController,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28.0),
                        child: Image.asset(
                            'images/bg.jpg',
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28.0),
                        child: Image.asset(
                          'images/bg1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IgnorePointer(
                child: Container(
                  alignment: AlignmentDirectional.topCenter,
                  width: 233, // 311,
                  height: 480, //641,
                  decoration: BoxDecoration(
                    // color: Color.fromRGBO(37, 37, 37, 1),
                    borderRadius: BorderRadius.circular(36.0),
                    border: Border.all(
                        color: Color.fromRGBO(52, 52, 52, 1), width: 8.0),
                    // image: DecorationImage(
                    //     image: AssetImage("images/bg.jpg"), fit: BoxFit.cover)
                  ),
                  child: Container(
                    height: 20,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(52, 52, 52, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(28),
                            bottomRight: Radius.circular(28))),
                  ),
                ),
              ),
            ],
          )));
  }
}
