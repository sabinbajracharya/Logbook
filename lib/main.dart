import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flare_flutter/flare_actor.dart';

var WD = 233.0, AC = Alignment.center, SP = C(margin: EdgeInsets.all(16));
lpd(t, [a = 140, b = 255]) => (a + (b - a) * t).toInt();
colr(l) => Color.fromRGBO(l, l, l, 1);

mixin CM {}
class C = Container with CM;

abstract class S extends StatefulWidget {}

main() => runApp(App());

class App extends StatelessWidget {
  build(c) => MaterialApp(home: HP());
}

class HP extends S {
  createState() => _HPS();
}

class _HPS extends State<HP> with TickerProviderStateMixin {
  var cp = 1, np = -1, fade = 1.0, _l = true, _d;
  AnimationController _loginButtonController;
  Animation buttonSqueezeAnimation, buttonZoomout;
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
      duration: new Duration(milliseconds: 3000),
      vsync: this
    );
    buttonSqueezeAnimation = Tween(
      begin: 200.0,
      end: 70.0,
    ).animate(
      CurvedAnimation(
        parent: _loginButtonController,
        curve: new Interval(0.0, 0.250)
      )
    );
    buttonZoomout = new Tween(
      begin: 70.0,
      end: 1000.0,
    ).animate(
      new CurvedAnimation(
        parent: _loginButtonController,
        curve: new Interval(
          0.550, 0.900,
          curve: Curves.bounceOut,
        ),
      )
    );
  }

  Future<Null> _playAnimation() async {
  try {
    _loginButtonController.forward();
    // _loginButtonController.reverse();
  }
  on TickerCanceled{}
}

  build(ctx) => ((_pCtrl, _) => Scaffold(
            body: _l
                ? Center(
                    child: C(
                      height: 25,
                      width: 50,
                      child: FlareActor("assets/l",
                          fit: BoxFit.contain, animation: "l"),
                    ),
                  )
                : Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _d["t"],
                            style: Theme.of(context).textTheme.headline,
                          ),
                          Text(_d["s"],
                              style: Theme.of(context).textTheme.subhead),
                          SP,
                          Stack(alignment: Alignment.center, children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(36),
                              child: C(
                                width: WD,
                                height: 480,
                                color: Colors.black87,
                              ),
                            ),
                            C(
                              height: 464,
                              child: NotificationListener(
                                onNotification: (n) {
                                  var pcp = _pCtrl.page;
                                  if (n is ScrollEndNotification) {
                                    setState(() => cp = pcp.floor());
                                  } else {
                                    setState(() {
                                      if (pcp - cp > 0) {
                                        /*forwardPage*/
                                        np = pcp.ceil();
                                        fade = np - pcp;
                                      } else {
                                        /*backwardPage*/
                                        np = pcp.floor();
                                        fade = pcp - np;
                                      }
                                    });
                                  }
                                },
                                child: PageView.builder(
                                  itemCount: _d['d'].length,
                                  controller: _pCtrl,
                                  itemBuilder: (_, i) => C(
                                        margin:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          child: InkWell(
                                            onTap: () => _pCtrl.animateToPage(i,
                                                duration: new Duration(
                                                    milliseconds: 350),
                                                curve: Curves.easeIn),
                                            child: Image.asset(_d['d'][i]['i'],
                                                color: i == np
                                                    ? colr(lpd(1 - fade))
                                                    : i == cp
                                                        ? colr(lpd(fade))
                                                        : colr(140),
                                                colorBlendMode:
                                                    BlendMode.modulate,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            IgnorePointer(
                              child: C(
                                alignment: AlignmentDirectional.topCenter,
                                width: WD,
                                height: 480,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36.0),
                                    border:
                                        Border.all(color: colr(52), width: 8)),
                                child: C(
                                  height: 20,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: colr(52),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(36),
                                          bottomRight: Radius.circular(36))),
                                ),
                              ),
                            ),
                          ]),
                          SP,
                        ],
                      ),
                      C(
                        alignment: Alignment.bottomCenter,
                        padding: buttonZoomout.value == 70 ? EdgeInsets.all(26) : EdgeInsets.all(0),
                        child: Material(
                          elevation: 5,
                            color: Colors.black,
                            borderRadius: buttonZoomout.value < 300 ? BorderRadius.all(Radius.circular(52)) : BorderRadius.all(Radius.circular(0)),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(52)),
                            onTap: ()=>_playAnimation(),
                            child: C(
                              width: buttonZoomout.value == 70 ? buttonSqueezeAnimation.value: buttonZoomout.value,
                              height: buttonZoomout.value == 70 ? 60.0 : buttonZoomout.value,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                  buttonSqueezeAnimation.value < 75.0
                                  ? buttonZoomout.value < 300 ? [CircularProgressIndicator(strokeWidth: 1.0, valueColor: new AlwaysStoppedAnimation(Colors.white))] : []
                                  : buttonSqueezeAnimation.value < 200.0
                                  ? [Icon(Icons.chevron_right,color: Colors.white)]
                                  : [Icon(Icons.chevron_right,color: Colors.white),Text(_d['a'],style: TextStyle(color: Colors.white))]
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ))(
      PageController(
          initialPage: cp,
          viewportFraction: WD / MediaQuery.of(ctx).size.width),
      DefaultAssetBundle.of(ctx).loadString("assets/data.json").then((v) async {
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _d = json.decode(v);
          _l = false;
        });
      }));
}
