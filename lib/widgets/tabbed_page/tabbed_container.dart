import 'package:flutter/material.dart';

class TabbedContainer extends StatefulWidget {
  final Map<Widget, Widget> tabs;

  TabbedContainer({
    @required this.tabs
  });
  
  @override
  State<StatefulWidget> createState() => _TabbedContainer();
}

class _TabbedContainer extends State<TabbedContainer> {
  Map<Widget, Widget> tabs;

  @override
  void initState() {
    super.initState();
    this.tabs = widget.tabs;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Scaffold(
        body: TabBarView(
          children: widget.tabs.values.toList(),
        ),
        bottomNavigationBar: Container(
          child: TabBar(
            labelColor: Theme.of(context).textTheme.body2.color,
            indicatorWeight: 5,
            labelPadding: EdgeInsets.all(0),
            labelStyle: Theme.of(context).textTheme.body2.copyWith(fontSize: 10),
            tabs: widget.tabs.keys.toList(),
          ),
        ),
      ),
    );
  }
}