import 'package:flutter/material.dart';

import 'await_widget.dart';
import 'error_widget.dart' as error_widget;

class FutureWidget<T> extends StatefulWidget {

	final Future<T> future;
	final Future<T> Function(BuildContext context)? retry;
	final Widget Function(BuildContext context, T? data) builder;
	final String? awaitMessage;
	final Widget Function(BuildContext context)? awaitWidget;
	final String? errorMessage;
	final Widget Function(BuildContext context, Object error, Future<T> Function(BuildContext context)? retry)? errorWidget;
	
	const FutureWidget({
		Key? key,
		required this.future,
		this.retry,
		required this.builder,
		this.awaitMessage,
		this.awaitWidget,
		this.errorMessage,
		this.errorWidget,
	}): super(key: key);

	@override
	State<StatefulWidget> createState() => _FutureWidgetState<T>();

}

class _FutureWidgetState<T> extends State<FutureWidget<T>> {

	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context) {

		return FutureBuilder<T?>(
			future: widget.future,
			builder: (context, snapshot) {

				if (snapshot.connectionState == ConnectionState.waiting) {
					return _buildAwaitWidget(context);
				} else if (snapshot.error != null) {
					return _buildErrorWidget(context, snapshot.error!);
				} else {
					return widget.builder(context, snapshot.data);
				}
				
			}
		);

	}

	_buildAwaitWidget(BuildContext context) {

		return (widget.awaitWidget != null 
			? widget.awaitWidget!(context) 
			: AwaitWidget( message: widget.awaitMessage ));

	}

	_buildErrorWidget(BuildContext context, Object error) {

		return (widget.errorWidget != null 
			? widget.errorWidget!(context, error, widget.retry) 
			: error_widget.ErrorWidget<T>( message: widget.errorMessage, retry: widget.retry ));

	}

}