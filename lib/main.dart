import 'dart:ui';import 'package:flutter/material.dart';import 'dart:convert';import 'package:flare_flutter/flare_actor.dart';import 'package:video_player/video_player.dart';import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
var WD=233.0,MAC=Alignment.center,AC=MainAxisAlignment.center,SP=C(margin:ei(16.0)),CB=Colors.black,CW=Colors.white;
lpd(t,[a=140,b=255])=>(a+(b-a)*t).toInt();
colr(l,[a=1.0])=>Color.fromRGBO(l,l,l,a);
vpc(u)async{var v=VideoPlayerController.asset(u);await v.initialize();v..setLooping(true)..play();return v;}
ei(x)=>EdgeInsets.all(x);
mixin M{}class C=Container with M;class CA=CurvedAnimation with M;abstract class S extends StatefulWidget{}
main()=>runApp(App());
class App extends StatelessWidget{build(c)=>MaterialApp(home:HP());}class HP extends S{createState()=>_HPS();}class _HPS extends State<HP> with SingleTickerProviderStateMixin{
var cp=1,np=-1,fade=1.0,_l=true,_d,_vr=false,_bc,_za,_fa,_vc,ICN=Icon(Icons.chevron_right,color:CW),_n=false;
ss(s)=>setState(s);lv(u)async{if(_vc!=null)await _vc.dispose();_vc=await vpc(u);ss(()=>_vr=true);}
TextTheme ts(c)=>Theme.of(c).textTheme;rc(r)=>Radius.circular(r);br(r)=>BorderRadius.circular(r);
initState(){
  super.initState();
  _bc=AnimationController(duration:Duration(seconds:4),vsync:this)..addListener(()=>ss((){}));
  _za=Tween(begin:50.0,end:1000.0).animate(CA(parent:_bc,curve:Interval(0.412,0.749,curve:Curves.bounceOut)));
  _fa=ColorTween(begin:colr(0),end:colr(0,0.0)).animate(CA(parent:_bc,curve:Interval(0.749,1,curve:Curves.ease)));
DefaultAssetBundle.of(context).loadString("assets/d").then((v)async{await Future.delayed(Duration(seconds:2));ss((){_d=json.decode(v);lv(_d['d'][cp]['v']);_l=false;});});}
build(cx)=>((_pCtrl)=>Scaffold(backgroundColor:CW,
body:_l
?Center(child:C(height:25,width:50,child:FlareActor("assets/l",fit:BoxFit.contain,animation:"l")))
:_za.value<1000
? Stack(children:[
Column(mainAxisAlignment:AC,children:[
C(height:52),
Text(_d["t"],style:ts(cx).headline),
Text(_d["s"],style:ts(cx).subhead),
SP,
Expanded(
child:Stack(alignment:MAC,children:[
ClipRRect(
borderRadius:br(36.0),
child:C(width:WD,color:Colors.black87)),
C(
child:NotificationListener(
onNotification:(n){
var pcp=_pCtrl.page;
if(n is ScrollEndNotification){if(pcp==cp)return;ss((){_vr=false;cp=pcp.floor();lv(_d['d'][cp]['v']);});}else{ss((){if(pcp-cp>0){np=pcp.ceil();fade=np-pcp;}else{np=pcp.floor();fade=pcp-np;}});}
},
child:PageView.builder(
itemCount:_d['d'].length,
controller:_pCtrl,
itemBuilder:(_,i)=>C(
margin:
EdgeInsets.only(left:8,right:8),
child:ClipRRect(
borderRadius:br(28.0),
child:InkWell(
onTap:(){
if(i!=cp)_vc.pause();
_pCtrl.animateToPage(i,
duration:Duration(
milliseconds:350),
curve:Curves.easeIn);
},
child:_vr &&
i==cp&&_vc.value.initialized
?VideoPlayer(_vc)
:Image.asset(_d['d'][i]['i'],
color:i==np
?colr(lpd(1-fade))
:i==cp
?colr(lpd(fade))
:colr(140),
colorBlendMode:
BlendMode.modulate,
fit:BoxFit.cover))))))),
IgnorePointer(child:C(alignment:AlignmentDirectional.topCenter,width:WD,decoration:BoxDecoration(borderRadius:br(36.0),border:Border.all(color:colr(52),width:8)),
child:C(height:20,width:120,decoration:BoxDecoration(color:colr(52),borderRadius:BorderRadius.only(bottomLeft:rc(36.0),bottomRight:rc(36.0))))))
])),
C(height:82)
]),
C(alignment:Alignment.bottomCenter,padding:_za.value==50?ei(16.0):ei(0.0),
child:Material(elevation:5,color:CB,borderRadius:_za.value<300?br(52.0):br(0.0),
child:InkWell(borderRadius:br(52.0),onTap:(){ss((){_vr=false;_n=true;});_vc..pause()..dispose();_bc.forward();},
child:C(width:_za.value,height:_za.value,alignment:MAC,
child:!_n?ICN:_za.value<300?CircularProgressIndicator(strokeWidth:1.0,valueColor:AlwaysStoppedAnimation(CW)):C()
))))
])
:Stack(children:[Scaffold(backgroundColor:CW,
appBar:AppBar(elevation:0,title:Text(_d['e'],style:TextStyle(color:CB)),backgroundColor:CW),
body:C(margin:EdgeInsets.only(left:8,right:8),
child:StaggeredGridView.countBuilder(crossAxisCount:4,itemCount:_d['f'].length,
itemBuilder:(_,i)=>C(child:InkWell(onTap:()=>Navigator.push(cx,
MaterialPageRoute(builder:(c)=>VP(_d['f'][i]))),
child:Hero(tag:_d['f'][i]['u'],child:Image.asset(_d['f'][i]['i'],fit:BoxFit.cover)))),
staggeredTileBuilder:(i)=>StaggeredTile.count(2,i.isEven?3:2),mainAxisSpacing:8,crossAxisSpacing:8))),
IgnorePointer(child:C(color:_fa.value))])))(PageController(initialPage:cp,viewportFraction:WD/MediaQuery.of(cx).size.width));
dispose(){_vc.dispose();_bc.dispose();super.dispose();}
}
class VP extends S{final o;VP(this.o);createState()=>_VS();}
class _VS extends State<VP>{var _vc,_vr=false;z(i,[y=0])=>IconButton(icon:Icon(i),color:Colors.white,onPressed:()=>y==1?Navigator.pop(context):null);
lv(u)async{_vc=await vpc(u);setState(()=>_vr=true);}
initState(){lv(widget.o['v']);super.initState();}
build(cx)=>((p)=>Hero(tag:p['u'],child:Scaffold(body:Stack(alignment:Alignment.bottomLeft,children:[_vr?VideoPlayer(_vc):Image.asset(p['i'],fit:BoxFit.cover,height:1/0,width:1/0),BackdropFilter(child:C(height:52,width:1/0,color:Colors.white.withOpacity(0.1),child:Align(alignment:Alignment.bottomRight,child:z(Icons.favorite_border))),filter:ImageFilter.blur(sigmaX:10,sigmaY:10)),z(Icons.close,1),]))))(widget.o);
dispose(){_vc.dispose();super.dispose();}}