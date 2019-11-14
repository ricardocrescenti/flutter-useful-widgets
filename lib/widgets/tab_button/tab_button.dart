import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const TabButton({
    this.icon,
    this.text
  });


  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    if (this.icon != null) {
      widgets.add(Icon(icon, color: Theme.of(context).iconTheme.color,));
    }

    if (this.text != null) {
      if (this.icon != null) {
        widgets.add(Padding(padding: EdgeInsets.all(2)));
      }
      widgets.add(Text(text, style: Theme.of(context).textTheme.body2.copyWith(fontSize: 10)));
    }

    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }
}