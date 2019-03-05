import 'dart:ui';import 'dart:math';import 'package:flutter/material.dart';import 'dart:convert';import 'package:flare_flutter/flare_actor.dart';import 'package:video_player/video_player.dart';import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
var WD=233.0,MAC=Alignment.center,AC=MainAxisAlignment.center,SP=C(margin:ei(16.0)),CB=Colors.black,CW=Colors.white;
lpd(t,[a=140,b=255])=>(a+(b-a)*t).toInt();
colr(l,[a=1.0])=>Color.fromRGBO(l,l,l,a);
ei(x)=>EdgeInsets.all(x);
mixin M{}class C=Container with M;class CA=CurvedAnimation with M;abstract class S extends StatefulWidget{}
main()=>runApp(App());
class App extends StatelessWidget{build(c)=>MaterialApp(home:HP());}class HP extends S{createState()=>_HPS();}class _HPS extends State<HP> with SingleTickerProviderStateMixin{
var cp=1,np=-1,fade=1.0,_l=true,_d,_bc,_za,_fa,ICN=Icon(Icons.chevron_right,color:CW),_n=false;
ss(s)=>setState(s);
TextTheme ts(c)=>Theme.of(c).textTheme;rc(r)=>Radius.circular(r);br(r)=>BorderRadius.circular(r);
initState(){super.initState();_bc=AnimationController(duration:Duration(seconds:4),vsync:this)..addListener(()=>ss((){}));_za=Tween(begin:50.0,end:1000.0).animate(CA(parent:_bc,curve:Interval(0.412,0.749,curve:Curves.bounceOut)));_fa=ColorTween(begin:colr(0),end:colr(0,0.0)).animate(CA(parent:_bc,curve:Interval(0.749,1,curve:Curves.ease)));
DefaultAssetBundle.of(context).loadString("assets/d").then((v)async{await Future.delayed(Duration(seconds:2));ss((){_d=json.decode(v);_l=false;});});}
build(cx)=>((_pCtrl)=>Scaffold(backgroundColor:CW,
body:_l
?Center(child:C(height:25,width:50,child:FlareActor("assets/l",fit:BoxFit.contain,animation:"l")))
:_za.value<1000
? Stack(children:[
Column(mainAxisAlignment:AC,children:[
C(height:72),
Text(_d["t"],style:ts(cx).headline.copyWith(fontWeight: FontWeight.w700)),
C(height:8),
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
if(n is ScrollEndNotification){if(pcp==cp)return;ss((){cp=pcp.floor();});}else{ss((){if(pcp-cp>0){np=pcp.ceil();fade=np-pcp;}else{np=pcp.floor();fade=pcp-np;}});}
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
_pCtrl.animateToPage(i,
duration:Duration(
milliseconds:350),
curve:Curves.easeIn);
},
child:L(_d['d'][i],!_n&&cp==i,o:i==np?max(0.7,1-fade):i==cp?max(0.7,fade):0.7))))))),
IgnorePointer(child:C(alignment:Alignment.topCenter,width:WD,decoration:BoxDecoration(borderRadius:br(36.0),border:Border.all(color:colr(52),width:8)),child:C(height:20,width:120,decoration:BoxDecoration(color:colr(52),borderRadius:BorderRadius.only(bottomLeft:rc(36.0),bottomRight:rc(36.0))))))
])),
C(height:82)
]),
C(alignment:Alignment.bottomCenter,padding:_za.value==50?ei(16.0):ei(0.0),
child:Material(elevation:5,color:CB,borderRadius:_za.value<300?br(52.0):br(0.0),
child:InkWell(borderRadius:br(52.0),onTap:(){ss((){_n=true;});_bc.forward();},
child:C(width:_za.value,height:_za.value,alignment:MAC,
child:!_n?ICN:_za.value<300?CircularProgressIndicator(strokeWidth:1.0,valueColor:AlwaysStoppedAnimation(CW)):C()
))))
])
:Stack(children:[Scaffold(backgroundColor:CW,
appBar:AppBar(elevation:0,title:Text(_d['e'],style:TextStyle(color:CB)),backgroundColor:CW),
body:C(margin:EdgeInsets.only(left:8,right:8),
child:StaggeredGridView.countBuilder(crossAxisCount:4,itemCount:_d['f'].length,
itemBuilder:(_,i)=>Hero(tag:_d['f'][i]['u'],child:Material(elevation:4,child:Ink.image(image:AssetImage(_d['f'][i]['i']),fit:BoxFit.cover,child:InkWell(onTap:()=>Navigator.push(cx,MaterialPageRoute(builder:(c)=>VP(_d['f'][i]))))))),
staggeredTileBuilder:(i)=>StaggeredTile.count(2,i.isEven?3:2),mainAxisSpacing:8,crossAxisSpacing:8))),
IgnorePointer(child:C(color:_fa.value))])))(PageController(initialPage:cp,viewportFraction:WD/MediaQuery.of(cx).size.width));
dispose(){_bc.dispose();super.dispose();}
}
class VP extends S{final o;VP(this.o);createState()=>_VS();}
class _VS extends State<VP>{z(i,[y=0])=>IconButton(icon:Icon(i),color:Colors.white,onPressed:()=>y==1?Navigator.pop(context):null);
build(cx)=>((p)=>Hero(tag:p['u'],child:Scaffold(body:Stack(alignment:Alignment.bottomLeft,children:[L(p,true),C(height:52,width:1/0,color:Colors.black.withOpacity(0.5),child:Align(alignment:Alignment.bottomRight,child:z(Icons.favorite_border))),z(Icons.close,1),]))))(widget.o);
}
class L extends S{final u,k,o;L(this.u,this.k,{this.o=1.0});createState()=>_L();}class _L extends State<L> {var v;initState(){v=VideoPlayerController.asset(widget.u['v']);v..setLooping(true)..initialize().then((_)=>setState((){}));super.initState();}build(_){var w;if(v.value.initialized){widget.k?v.play():v.pause();w=VideoPlayer(v);}else w=Image.asset(widget.u['i'],fit:BoxFit.cover,height:1/0,width:1/0);return Opacity(child:w,opacity:widget.o);}dispose(){v.dispose();super.dispose();}}