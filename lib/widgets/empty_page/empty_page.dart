import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  static EdgeInsets defaultPadding = const EdgeInsets.all(20);
  static double defaultOpacity = 0.7;

  final EdgeInsets padding;
  final double opacity;
  final Widget title;
  final Widget body;
  final List<Widget> actions;
  final bool scroll;

  EmptyPage({
    this.padding,
    this.opacity,
    this.title,
    @required this.body,
    this.actions,
    this.scroll = true,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> childs = [];

    if (title != null) {
      childs.add(title);
    }

    childs.add(Padding(
      padding: EdgeInsets.only(
        top: (childs.isNotEmpty ? 20 : 0),
        bottom: (actions != null && actions.isNotEmpty ? 10 : 0)),
      child: body
    ));

    if (actions != null) {
      childs.addAll(actions);
    }

    Widget child = Opacity(
      opacity: this.opacity ?? EmptyPage.defaultOpacity,
      child: Padding(
        padding: this.padding ?? EmptyPage.defaultPadding, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: childs,
          )
        )
      )
    );

    return (scroll ? SingleChildScrollView(child: child) : child);
  }
}