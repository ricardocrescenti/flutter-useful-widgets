import 'package:flutter/material.dart';

enum TabPosition { top, bottom }

class TabbedContainer extends StatefulWidget {
  final Map<Widget, Widget> tabs;
  final bool keepTabViewAlive;
  final TabPosition tabPosition;
  final void Function(TabController tabController) onTabChanged;
  final Widget Function(BuildContext context, Map<Widget, Widget> tabs, TabBar tabBar, TabBarView tabBarView) builder;

  TabbedContainer({
    @required this.tabs,
    this.keepTabViewAlive = true,
    this.tabPosition = TabPosition.top,
    this.onTabChanged,
    this.builder
  }) {
    assert(this.tabs != null && this.tabs.isNotEmpty, 'You need to inform the tabs');
  }

  Widget build(BuildContext context, Map<Widget, Widget> tabs, TabBar tabBar, TabBarView tabBarView) {
    if (builder != null) {
      return builder(context, tabs, tabBar, tabBarView);
    }
    
    return Scaffold(
      body: (this.tabPosition == TabPosition.bottom 
        ? tabBarView
        : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            tabBar,
            Expanded(child: tabBarView)
          ]
        )
      ),
      bottomNavigationBar: (this.tabPosition == TabPosition.bottom 
        ? Container(
          child: tabBar)
        : null
      )
    );
  }
  
  @override
  State<StatefulWidget> createState() => _TabbedContainer();
}

class _TabbedContainer extends State<TabbedContainer> with TickerProviderStateMixin {
  //Map<Widget, Widget> tabs;
  TabController tabContoller;

  @override
  void initState() {
    super.initState();

    //this.tabs = widget.tabs;
    this.tabContoller = TabController(length: widget.tabs.length, vsync: this);  
    this.tabContoller.addListener(_onTabChanged);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.keepTabViewAlive) {
      this.widget.tabs.forEach((key, value) {
        if (!(this.widget.tabs[key] is _KeepTabViewAlive)) {
          this.widget.tabs[key] = _KeepTabViewAlive(child: value);
        }
      });
    }

    TabBar tabBar = TabBar(
      controller: tabContoller,
      labelColor: Theme.of(context).textTheme.bodyText1.color,
      indicatorWeight: 5,
      labelPadding: EdgeInsets.all(0),
      //labelStyle: Theme.of(context).textTheme.body2.copyWith(fontSize: 10),
      indicatorColor: Theme.of(context).colorScheme.primary,
      tabs: widget.tabs.keys.toList(),
    );
    
    TabBarView tabBarView = TabBarView(
      controller: tabContoller,
      children: widget.tabs.values.toList(),
    );

    return DefaultTabController(
      length: widget.tabs.length,
      child: widget.build(context, widget.tabs, tabBar, tabBarView),
    );
  }

  void _onTabChanged() {
    if (widget.onTabChanged != null) {
      widget.onTabChanged(tabContoller);
    }
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