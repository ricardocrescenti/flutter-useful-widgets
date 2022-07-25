import 'package:flutter/material.dart';

enum TabPosition { top, bottom }

class TabbedContainer extends StatefulWidget {

	final Map<Widget, Widget> tabs;
	final bool keepTabViewAlive;
	final TabPosition tabPosition;
	final void Function(TabController tabController)? onTabChanged;
	final Widget Function(BuildContext context, Map<Widget, Widget> tabs, TabBar tabBar, TabBarView tabBarView)? builder;

	const TabbedContainer({
		Key? key,
		required this.tabs,
		this.keepTabViewAlive = true,
		this.tabPosition = TabPosition.top,
		this.onTabChanged,
		this.builder
	}): super(key: key);

	Widget build(BuildContext context, Map<Widget, Widget> tabs, TabBar tabBar, TabBarView tabBarView) {
		
		assert(tabs.isNotEmpty, 'You need to inform the tabs');

		if (builder != null) {
			return builder!(context, tabs, tabBar, tabBarView);
		}
		
		return Scaffold(
			body: (tabPosition == TabPosition.bottom 
				? tabBarView
				: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: [
						tabBar,
						Expanded(child: tabBarView)
					]
				)
			),
			bottomNavigationBar: (tabPosition == TabPosition.bottom 
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

	late TabController tabContoller;

	@override
	void initState() {

		super.initState();
		initTabController();

	}

	@override
	void didUpdateWidget(covariant TabbedContainer oldWidget) {

		super.didUpdateWidget(oldWidget);

		if (tabContoller.length != widget.tabs.length) {
			initTabController();
		}

	}

	@override
	Widget build(BuildContext context) {

		if (widget.keepTabViewAlive) {
			widget.tabs.forEach((key, value) {
				if (widget.tabs[key] is! _KeepTabViewAlive) {
					widget.tabs[key] = _KeepTabViewAlive(child: value);
				}
			});
		}

		TabBar tabBar = TabBar(
			controller: tabContoller,
			labelColor: Theme.of(context).textTheme.bodyText1!.color,
			indicatorWeight: 5,
			labelPadding: const EdgeInsets.all(0),
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

	void initTabController() {

		tabContoller = TabController(length: widget.tabs.length, vsync: this);  
		tabContoller.addListener(_onTabChanged);

	}

	void _onTabChanged() {

		if (widget.onTabChanged != null) {
			widget.onTabChanged!(tabContoller);
		}

	}
}

class _KeepTabViewAlive extends StatefulWidget {

	final Widget child;

	const _KeepTabViewAlive({
		required this.child
	});

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