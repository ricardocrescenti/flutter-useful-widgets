import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

class NavigationUtilities {
  
  @protected
  navigate(BuildContext context, Widget widget) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        })
    );
  }

  @protected
  dialog(BuildContext context, Widget title, Widget widget) async  {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title,
        content: widget,
      )
    );
  }

  Future<T> showAwait<T>(BuildContext context, String message, Future<T> Function() function) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        function()
          .then((onValue) => Navigator.of(context).pop(onValue))
          .catchError((onError) => Navigator.of(context).pop(null));

        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AwaitDialogWidget(message == null ? 'Aguarde' : message),
        );
      },
    );
  }

  Future alertDialog(BuildContext context, Widget title, Widget message) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: DefaultDialogWidget(
            title: title, 
            message: message)
        );
      },
    );
  }
  
  errorDialog(BuildContext context, Widget title, Widget message) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: DefaultDialogWidget(
            title: title, 
            message: message)
        );
      },
    );
  }

  bool close(BuildContext context) {
    return Navigator.of(context).pop();
  }
}