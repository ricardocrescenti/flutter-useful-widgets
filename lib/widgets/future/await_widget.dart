import 'package:flutter/material.dart';

/// Default await widget used by `FutureWidget`
class AwaitWidget extends StatelessWidget {
  final String message;
  AwaitWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.all(10),),
          Text(message)
        ],
      )
    );
  }
}