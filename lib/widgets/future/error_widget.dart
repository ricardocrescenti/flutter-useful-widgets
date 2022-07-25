import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

/// Default error widget used by `FutureWidget`
class ErrorWidget<T> extends StatelessWidget {

	final String? message;
	final Future<T> Function(BuildContext context)? retry;
	
	const ErrorWidget({
		Key? key,
		this.message,
		this.retry
	}): super(key: key);

	@override
	Widget build(BuildContext context) {

		UsefulWidgetsLocalizations localization = UsefulWidgetsLocalizations.of(context);

		List<Widget> widgets = [
			const Icon(Icons.error, size: 70,),
			Padding(
				padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
				child: Text(message ?? localization[FutureWidgetMessages.errorMessage], textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1,)
			)
		];

		if (retry != null) {
			widgets.addAll([
				const Padding(padding: EdgeInsets.all(10)),
				ElevatedButton(
					child: Text(localization[FutureWidgetMessages.retryButton]),
					onPressed: () => retry!(context),
				)
			]);
		}

		return Center(
			child: Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.center,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: widgets,
			)
		);

	}
}