import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Color color;
  final Function() onPressed;
  final Widget child;

  BottomButton({
    this.color,
    @required this.onPressed,
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15),
      color: (color == null ? (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryColor) : color),
      textColor: (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryTextTheme.title.color),
      child: child,
      onPressed: onPressed,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}