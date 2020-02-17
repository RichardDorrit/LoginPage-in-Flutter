import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//A page for when connecting to the firebase, like verification and fetch the data.
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.blueAccent,
          size:50
        )
      )
    );
  }
}