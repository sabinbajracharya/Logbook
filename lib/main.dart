import 'package:flutter/material.dart';import 'dart:convert';import 'package:flare_flutter/flare_actor.dart';import 'package:video_player/video_player.dart';import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
ei(x)=>EdgeInsets.all(x);
var WD=233.0,AC=Alignment.center,SP=C(margin:ei(16.0));
lpd(t,[a=140,b=255])=>(a+(b-a)*t).toInt();
colr(l,[a=1.0])=>Color.fromRGBO(l,l,l,a);
mixin M {}class C=Container with M;class CA=CurvedAnimation with M;abstract class S extends StatefulWidget {}
main()=>runApp(App());
class App extends StatelessWidget{build(c)=>MaterialApp(home:HP());}
class HP extends S{createState()=>_HPS();}
class _HPS extends State<HP> with SingleTickerProviderStateMixin{
var cp=1,np=-1,fade=1.0,_l=true,_d,_vr=false,_bc,_sa,_za,_fa,_vc,ICN=Icon(Icons.chevron_right,color:Colors.white);
ss(s)=>setState(s);
lv(u)async{if(_vc!=null)await _vc.dispose();_vc=VideoPlayerController.asset(u)..initialize().then((_){_vc..setLooping(true)..play();ss(()=>_vr=true);});}
TextTheme ts(c)=>Theme.of(c).textTheme;
rc(r)=>Radius.circular(r);
br(r)=>BorderRadius.circular(r);
initState(){super.initState();
_bc=AnimationController(duration:new Duration(seconds:4),vsync:this)..addListener(()=>ss((){}));
_sa=Tween(begin:200.0,end:50.0).animate(CA(parent:_bc,curve:Interval(0.0,0.187)));
_za=Tween(begin:50.0,end:1000.0).animate(CA(parent:_bc,curve:Interval(0.412,0.749,curve:Curves.bounceOut)));
_fa=ColorTween(begin:colr(0),end:colr(0,0.0)).animate(CA(parent:_bc,curve:Interval(0.749,1,curve:Curves.ease)));
DefaultAssetBundle.of(context).loadString("assets/d").then((v)async{await Future.delayed(Duration(seconds: 1));ss((){_d=json.decode(v);lv(_d['d'][cp]['v']);_l=false;});});
}
build(cx)=>((_pCtrl)=>
Scaffold(body:_l
?Center(child:C(height:25,width: 50,child:FlareActor("assets/l",fit: BoxFit.contain,animation:"l")))
:_za.value<1000
?Stack(children:[Column(mainAxisAlignment:MainAxisAlignment.center,children:[C(height:52),Text(_d["t"],style:ts(cx).headline),Text(_d["s"],style:ts(cx).subhead),SP,Expanded(child:Stack(alignment:Alignment.center,children:[ClipRRect(borderRadius:br(36.0),child: C(width:WD,color:Colors.black87)),C(child: NotificationListener(onNotification:(n){var pcp=_pCtrl.page;if(n is ScrollEndNotification){if(pcp==cp)return;ss((){_vr=false;cp=pcp.floor();lv(_d['d'][cp]['v']);});}else{ss((){if(pcp-cp>0){/*forwardPage*/np=pcp.ceil();fade=np-pcp;}else{/*backwardPage*/np=pcp.floor();fade=pcp-np;}});}},child: PageView.builder(itemCount:_d['d'].length,controller:_pCtrl,itemBuilder:(_,i)=>C(margin:EdgeInsets.only(left:8,right:8),child:ClipRRect(borderRadius:br(28.0),child:InkWell(onTap:(){if (i != cp)_vc.pause();_pCtrl.animateToPage(i,duration:Duration(milliseconds:350),curve:Curves.easeIn);},child:_vr&&i==cp&&_vc.value.initialized?AspectRatio(aspectRatio:_vc.value.aspectRatio,child:VideoPlayer(_vc)):Image.asset(_d['d'][i]['i'],color:i==np?colr(lpd(1-fade)):i==cp?colr(lpd(fade)):colr(140),colorBlendMode:BlendMode.modulate,fit:BoxFit.cover))))))),IgnorePointer(child: C(alignment:AlignmentDirectional.topCenter,width:WD,decoration:BoxDecoration(borderRadius:br(36.0),border:Border.all(color:colr(52),width:8)),child:C(height:20,width:120,decoration:BoxDecoration(color:colr(52),borderRadius:BorderRadius.only(bottomLeft:rc(36.0),bottomRight:rc(36.0))))))])),C(height:82)]),C(alignment:Alignment.bottomCenter,padding:_za.value==50?ei(16.0):ei(0.0),child:Material(elevation:5,color:Colors.black,borderRadius:_za.value<300?br(52.0):br(0.0),child:InkWell(borderRadius:br(52.0),onTap:(){ss(()=>_vr=false);_vc..pause()..dispose();_bc.forward();},child:C(width:_za.value==50?_sa.value:_za.value,height:_za.value,child:Row(mainAxisAlignment:MainAxisAlignment.center,children:_sa.value<75.0?_za.value<300?[CircularProgressIndicator(strokeWidth:1.0,valueColor:AlwaysStoppedAnimation(Colors.white))]:[]:_sa.value<200.0?[ICN]:[ICN,Text(_d['a'],style:TextStyle(color:Colors.white))])))))])
:Stack(children:[Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(elevation: 0, title: Text('Logbook', style: TextStyle(color: Colors.black),), backgroundColor: Colors.white, centerTitle: true,),
  body: C(
    margin: EdgeInsets.only(left:8, right:8),
      child: StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: _d['f'].length,
    itemBuilder: (_,i) => C(
        child: GestureDetector(
          onTap: (){Navigator.push(cx, MaterialPageRoute(builder: (c)=>VP(_d['f'][i])));},
                  child: Card(
            shape: RoundedRectangleBorder(borderRadius: br(26.0),),
            elevation: 2,
            child: ClipRRect(borderRadius: br(26.0),child:Hero(tag:_d['f'][i]['u'], child:Image.asset(_d['f'][i]['i'],fit: BoxFit.cover))),
          ),
        )
    ),
    staggeredTileBuilder:(i)=>StaggeredTile.count(2,i.isEven?3:2),mainAxisSpacing:8,crossAxisSpacing:8,
))), IgnorePointer(child:C(color: _fa.value))])
))(PageController(initialPage:cp,viewportFraction:WD/MediaQuery.of(cx).size.width));
dispose(){_vc.dispose();_bc.dispose();super.dispose();}
}

class VP extends S{
  final o;
  VP(this.o);
  createState()=>_VS();
}
class _VS extends State<VP>{
  var _vc,_vr=false;
  lv(u)async{if(_vc!=null)await _vc.dispose();_vc=VideoPlayerController.asset(u)..initialize().then((_){_vc..setLooping(true)..play();setState(()=>_vr=true);});}
  @override
  void initState() {
    lv(widget.o['v']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var p = widget.o;
    return Scaffold(
      body: _vr
      ?VideoPlayer(_vc)

      :Hero(tag:p['u'], child:Image.asset(p['i'],fit: BoxFit.cover,height: 1/0,
    width: 1/0)),
    );
  }
  @override
  void dispose() {
    _vc.dispose();
    super.dispose();
  }
}