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

  Future<T> showAwait<T>(BuildContext context, String message, Function function) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AwaitDialogWidget(message == null ? 'Aguarde' : message),
        );
      },
    );

    dynamic result;
    try {
      result = await function();
    } catch (error) {
      print(error);
    }

    Navigator.pop(context);

    return result;
  }

  Future<T> alertDialog<T>(BuildContext context, Widget title, Widget message) {
    showDialog<void>(
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
    
    return null;
  }
  
  Future<T> errorDialog<T>(BuildContext context, Widget title, Widget message) {
    showDialog<void>(
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
    
    return null;
  }

  bool close(BuildContext context) {
    return Navigator.of(context).pop();
  }
}