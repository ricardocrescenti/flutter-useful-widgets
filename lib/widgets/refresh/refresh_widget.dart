import 'package:flutter/material.dart';

class RefreshWidget extends StatefulWidget {

	final Future Function(BuildContext context) future;
	final Widget Function(BuildContext context) builder;
	
	const RefreshWidget({
		Key? key,
		required this.future, 
		required this.builder
	}): super(key: key);

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

	Future<void> _refresh(BuildContext context) async {

		await widget.future(context);
		setState(() {});

	}
}