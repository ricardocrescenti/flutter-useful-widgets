import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

class IconSearchButton extends StatelessWidget {
  final SearchWidget Function(BuildContext context) search;

  IconSearchButton(this.search);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => search(context)
        )
      ),
    );
  }
}