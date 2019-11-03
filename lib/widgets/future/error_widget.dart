import 'package:flutter/material.dart';

/// Default error widget used by `FutureWidget`
class ErrorWidget extends StatelessWidget {
  final String message;
  final Function(BuildContext context) retry;
  
  ErrorWidget(
    this.message,
    this.retry);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Icon(Icons.error, size: 70,),
      Padding(padding: EdgeInsets.all(5),),
      Text(message, style: Theme.of(context).textTheme.body2,)
    ];

    if (retry != null) {
      widgets.addAll([
        Padding(padding: EdgeInsets.all(10),),
        RaisedButton(
          child: Text('Tentar Novamente'),
          onPressed: () => retry(context),
        )
      ]);
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets,
      )
    );
  }
}