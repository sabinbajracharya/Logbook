import 'package:flutter/material.dart';
var WD=233.0,AC=Alignment.center;
lpd(t,[a=140,b=255])=>(a+(b-a)*t).toInt();
colr(l)=>Color.fromRGBO(l,l,l,1);

mixin CM{}class C=Container with CM;

main()=>runApp(App());

class App extends StatelessWidget {build(c) => MaterialApp(home:HP());}
class S extends StatefulWidget {createState() => null;}
class HP extends S {createState() => _HPS();}
class _HPS extends State<HP> {
  var cp=1,np=-1,fade=1.0,images=['images/bg.jpg','images/bg2.jpg','images/bg1.jpg'];
    build(ctx)=>((_pCtrl)=>
      Scaffold(body:C(color:Colors.white,alignment:AC,
      child:Stack(alignment:AC,
        children:[ClipRRect(borderRadius:BorderRadius.circular(36),child:C(width:WD,height:480,color:Colors.black87)),
          C(height:464,
            child:NotificationListener(onNotification:(n){var pcp=_pCtrl.page;if(n is ScrollEndNotification){setState(()=>cp=pcp.floor());}else{setState((){if(pcp-cp>0){/*forwardPage*/np=pcp.ceil();fade=np-pcp;}else{/*backwardPage*/np=pcp.floor();fade=pcp-np;}});}},
              child:PageView.builder(itemCount:images.length,controller:_pCtrl,itemBuilder:(_,i)=>C(margin:EdgeInsets.only(left:8,right:8),child:ClipRRect(borderRadius:BorderRadius.circular(28),child:InkWell(onTap: ()=>_pCtrl.animateToPage(i, duration: new Duration(milliseconds: 350),curve: Curves.easeIn),child: Image.asset(images[i],color:i==np?colr(lpd(1-fade)):i==cp?colr(lpd(fade)):colr(140),colorBlendMode:BlendMode.modulate,fit:BoxFit.cover),),),),),
            ),
          ),IgnorePointer(child:C(alignment:AlignmentDirectional.topCenter,width:WD,height:480,decoration:BoxDecoration(borderRadius:BorderRadius.circular(36.0),border:Border.all(color:colr(52),width:8)),child:C(height:20,width:120,decoration:BoxDecoration(color:colr(52),borderRadius:BorderRadius.only(bottomLeft:Radius.circular(36),bottomRight:Radius.circular(36)))))),],
    ),),))(PageController(initialPage:cp,viewportFraction:WD/MediaQuery.of(ctx).size.width));
}
