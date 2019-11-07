import 'package:flutter/material.dart';

class RefreshWidget extends StatefulWidget {
  final Future Function() future;
  final Widget Function(BuildContext) builder;
  
  RefreshWidget({
    @required this.future, 
    @required this.builder});

  @override
  State<StatefulWidget> createState() => _RefreshWidget();
}

class _RefreshWidget extends State<RefreshWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: widget.builder(context),
    );
  }

  Future<Null> _refresh() async {
    await widget.future();
    setState(() {});
    return null;
  }
}