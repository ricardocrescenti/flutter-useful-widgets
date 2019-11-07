import 'package:flutter/material.dart';

class RefreshWidget extends StatefulWidget {
  final Future Function(BuildContext context) future;
  final Widget Function(BuildContext context) builder;
  
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
      onRefresh: () => _refresh(context),
      child: widget.builder(context),
    );
  }

  Future<Null> _refresh(BuildContext context) async {
    await widget.future(context);
    setState(() {});
    return null;
  }
}