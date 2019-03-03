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

class _HPS extends State<HP> {
  var cp = 1, np = -1, fade = 1.0, _l = true, _d;
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
                        padding: EdgeInsets.all(26),
                        child: Material(
                          elevation: 5,
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(52)),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(52)),
                            onTap: () {},
                            child: C(
                              width: 200,
                              height: 52,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.chevron_right,color: Colors.white),
                                  Text(
                                    _d['a'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
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
