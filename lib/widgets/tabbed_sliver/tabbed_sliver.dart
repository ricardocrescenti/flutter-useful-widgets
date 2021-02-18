import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

class TabbedSliver extends TabbedContainer {
  final List<Widget> headers;

  TabbedSliver({
    @required this.headers,
    @required Map<Widget, Widget> tabs
  }) : super(tabs: tabs) {
    assert(this.headers != null && this.headers.isNotEmpty, 'You need to inform the header widgets');
  }

  @override
  Widget build(BuildContext context, Map<Widget, Widget> tabs, TabBar tabBar, TabBarView tabBarView) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(headers)
          ),
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: _SliverTabBarDelegate(
                child: tabBar
              )
            ),
          ),
        ];
      },
      body: TabBarView(
        children: tabs.values.map((Widget widget) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  key: PageStorageKey<Widget>(widget),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([widget])),
                    ),
                  ],
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  _SliverTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: this.child
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}