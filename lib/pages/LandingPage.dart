import 'package:flutter/material.dart';
import 'package:login/pages/LoginPage.dart';

class LandingPage extends StatefulWidget {

  LandingPage({Key key}) : super(key : key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context){
    return new Material(
      child: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              child: new Image.asset(
                "assets/Starting_page.png",
                fit: BoxFit.cover,
              )
            ),
            new Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.fromLTRB(0, 45, 10, 0),
              // skip button.
              child: OutlineButton(
                child: new Text(
                  'skip',
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.black),
                ),
                shape: new StadiumBorder(),
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                },
              )
            )
          ]
        )
      )
    );
  }

  @override
  void initState(){
    super.initState();
    countDown();
  }
  //let the landing page(Ads) exist for 10 sec then jump to loginpage aumatically. 
  void countDown(){
    var _duration = new Duration(seconds: 10);
    new Future.delayed(_duration,go2LoginPage);
  }

  void go2LoginPage(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }
  
}