import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Function() onPressed;
  final Widget child;

  BottomButton({
    this.color,
    this.textColor,
    @required this.onPressed,
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15),
      color: (color == null ? (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryColor) : color),
      textColor: (textColor == null ? (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryTextTheme.headline6.color) : textColor),
      child: child,
      onPressed: onPressed,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}