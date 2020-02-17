import 'package:flutter/material.dart';
import 'package:login/pages/Home.dart';
import 'package:login/pages/Loading.dart';
import 'package:login/services/AuthService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context){
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _authService.signOut();
            },
          )
        ],
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
              ),
              new Icon(
                Icons.person,
                color: Colors.black,
                size:200,
              ),
              SizedBox(
                child: new TextField(
                  decoration: InputDecoration(
                    hintText: "UserName",
                    icon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    )
                  ),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                width: 350,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
              ),
              SizedBox(
                child: new TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )
                  ),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                width: 350
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
              ),
              new RaisedButton(
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = _authService.signInWithEmailAndPassword(email, password);
                    if(result = null){
                      setState(() {
                        error = 'Wrong email or password';
                        loading = false;
                      });
                    }
                  }
                },
                color: Colors.blue,
                child: new Text("Log in"),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.black),
                )
              ),
              new RaisedButton(
                color: Colors.blue,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text('Register'),
                onPressed: (){},
              ),
              new RaisedButton(
                color: Colors.blue,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text('Forgot password'),
                onPressed: (){},
              ),
              new RaisedButton(
                color: Colors.blue,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text('Sign in Anon'),
                onPressed: () async {
                  dynamic result = await _authService.signInAnon();
                  if(result = null){
                    print('Couldnt sign in ');
                  }else{
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Home()));
                  }
                },
              )
            ],
          )
        )
      )
    );
  }
}