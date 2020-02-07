import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

class DefaultDialogWidget extends StatelessWidget with NavigationUtilities {
  final Widget title;
  final Widget leading;
  final Widget message;
  final List<Actions> actions;

  DefaultDialogWidget({
    this.title, 
    this.leading,
    @required this.message,
    this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      title: title,
      content: (leading == null
        ? message
        : Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              leading,
              Padding(padding: EdgeInsets.only(left: 10),),
              message
            ],
          )),
      actions: (actions == null 
        ? [FlatButton(child: Text('OK'), onPressed: () => close(context),)]
        : actions),
    );
  }

}