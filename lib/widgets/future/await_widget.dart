import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

/// Default await widget used by `FutureWidget`
class AwaitWidget extends StatelessWidget {

	final String? message;

	const AwaitWidget({
		Key? key,
		this.message
	}): super(key: key);

	@override
	Widget build(BuildContext context) {

		return Center(
			child: Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.center,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					const CircularProgressIndicator(),
					Padding(
						padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
						child: Text(message ?? UsefulWidgetsLocalizations.of(context)[FutureWidgetMessages.awaitMessage])
					)
				],
			)
		);

	}
}