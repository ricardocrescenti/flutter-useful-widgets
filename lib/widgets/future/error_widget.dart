import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

/// Default error widget used by `FutureWidget`
class ErrorWidget extends StatelessWidget {
  final String message;
  final Function(BuildContext context) retry;
  
  ErrorWidget(
    this.message,
    this.retry);

  @override
  Widget build(BuildContext context) {
    UsefulWidgetsLocalizations localization = UsefulWidgetsLocalizations.of(context);

    List<Widget> widgets = [
      Icon(Icons.error, size: 70,),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(message ?? localization[FutureWidgetMessages.errorMessage], textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1,)
      )
    ];

    if (retry != null) {
      widgets.addAll([
        Padding(padding: EdgeInsets.all(10),),
        RaisedButton(
          child: Text(localization[FutureWidgetMessages.retryButtonText]),
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