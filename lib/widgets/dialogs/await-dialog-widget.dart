import 'package:flutter/material.dart';

class AwaitDialogWidget extends StatelessWidget {
  final String message;

  AwaitDialogWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.only(left: 50, top: 25, right: 50, bottom: 25),
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.all(10),),
                  Text(message, textAlign: TextAlign.center,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}