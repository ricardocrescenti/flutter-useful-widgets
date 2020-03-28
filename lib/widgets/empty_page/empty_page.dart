import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final EdgeInsets padding;
  final Widget title;
  final Widget body;
  final List<Widget> actions;

  EmptyPage({
    this.padding = const EdgeInsets.all(20),
    this.title,
    @required this.body,
    this.actions
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

    return Padding(
      padding: padding, 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: childs,
        )
      )
    );
  }
}