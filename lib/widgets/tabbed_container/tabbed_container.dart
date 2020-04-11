import 'package:flutter/material.dart';

class TabbedContainer extends StatefulWidget {
  final Map<Widget, Widget> tabs;
  final bool keepTavViewAlive;
  final Widget Function(BuildContext context, Map<Widget, Widget> tabs, TabBar tabBar, TabBarView tabBarView) builder;

  TabbedContainer({
    @required this.tabs,
    this.keepTavViewAlive = true,
    this.builder
  }) {
    assert(this.tabs != null && this.tabs.isNotEmpty, 'You need to inform the tabs');
  }

  Widget build(BuildContext context, Map<Widget, Widget> tabs, TabBar tabBar, TabBarView tabBarView) {
    if (builder != null) {
      return builder(context, tabs, tabBar, tabBarView);
    }
    
    return Scaffold(
      body: tabBarView,
      bottomNavigationBar: Container(
        child: tabBar,
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() => _TabbedContainer();
}

class _TabbedContainer extends State<TabbedContainer> {
  Map<Widget, Widget> tabs;
  TabController tabContoller;

  @override
  void initState() {
    super.initState();
    this.tabs = widget.tabs;

    if (widget.keepTavViewAlive) {
      this.tabs.forEach((key, value) => this.tabs[key] = _KeepTabViewAlive(child: value));
    }
  }

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      controller: tabContoller,
      labelColor: Theme.of(context).textTheme.body2.color,
      indicatorWeight: 5,
      labelPadding: EdgeInsets.all(0),
      labelStyle: Theme.of(context).textTheme.body2.copyWith(fontSize: 10),
      tabs: tabs.keys.toList(),
    );
    
    TabBarView tabBarView = TabBarView(
      controller: tabContoller,
      children: tabs.values.toList(),
    );

    return DefaultTabController(
      length: tabs.length,
      child: widget.build(context, tabs, tabBar, tabBarView),
    );
  }
}

class _KeepTabViewAlive extends StatefulWidget {
  final Widget child;
  _KeepTabViewAlive({@required this.child});

  @override
  State<StatefulWidget> createState() => _KeepTabViewAliveState();
}

class _KeepTabViewAliveState extends State<_KeepTabViewAlive> with AutomaticKeepAliveClientMixin<_KeepTabViewAlive> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}