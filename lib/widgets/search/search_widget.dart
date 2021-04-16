import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:useful_widgets/useful_widgets.dart';
import 'package:useful_widgets/widgets/future/await_widget.dart';

import 'active_page_enum.dart';

class SearchWidget<T> extends StatefulWidget {
	final String hintText;
	final String initialSearchText;
	final AppBar Function(BuildContext context, Widget searchField) buildAppBar;
	final Widget Function(BuildContext context) buildSugestion;
	final Widget Function(BuildContext context) buildAwaitSearch;
	final Widget Function(BuildContext context, T result) buildResult;
	final Future<T> Function(BuildContext context, String query) search;
	final SearchController<T> controller;

	SearchWidget({
		this.hintText,
		this.initialSearchText,
		this.buildAppBar,
		this.buildSugestion,
		this.buildAwaitSearch,
		@required this.buildResult,
		@required this.search,
		this.controller
	});

	@override
	State<StatefulWidget> createState() => _SearchWidgetState<T>();
}

class _SearchWidgetState<T> extends State<SearchWidget<T>> {
	SearchController<T> controller;
	TextEditingController textEditingController = TextEditingController();

	void didChangeDependencies() {
		super.didChangeDependencies();

		if (controller == null) {    
			controller = widget.controller ?? SearchController<T>();
			controller.addListener(listener);

			if (widget.initialSearchText?.isNotEmpty ?? false) {
				textEditingController.text = widget.initialSearchText;
				controller.futureSearch = widget.search(context, textEditingController.text);
			}
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: buildAppBar(context, buildSearchField()),
			body: buildBody()
		);
	}

	AppBar buildAppBar(BuildContext context, Widget searchField) {
		if (widget.buildAppBar != null) {
			return widget.buildAppBar(context, searchField);
		}

		return AppBar(
			backgroundColor: Theme.of(context).scaffoldBackgroundColor,
			titleSpacing: 4,
			title: searchField,
			automaticallyImplyLeading: false,
		);
	}

	Widget buildSearchField() {
		return TextField(
			autofocus: false,
			textInputAction: TextInputAction.search,
			decoration: InputDecoration(
				border: InputBorder.none,
				filled: true,
				hintText: widget.hintText ?? UsefulWidgetsLocalizations.of(context)[SearchWidgetMessages.searchHint],
				prefixIcon: IconButton(
					icon: Icon(Icons.chevron_left),
					onPressed: () => close(context),
				),
				suffixIcon: IconButton(
					icon: Icon(Icons.search),
					onPressed: () => search(context, textEditingController.text)
				)
			),
			controller: textEditingController,
			style: Theme.of(context).textTheme.headline6,
			onSubmitted: (value) => search(context, value)
		);
	}

	Widget buildBody() {		
		if (controller.activePage == ActivePage.result) {
			return FutureWidget<T>(
				future: controller.futureSearch,
				awaitWidget: (context) => buildAwaitSearch(context),
				builder: (context, result) => widget.buildResult(context, controller.result)
			);
		} else {
			return widget.buildSugestion(context);
		}
	}

	Widget buildAwaitSearch(BuildContext context) {
		if (widget.buildAwaitSearch != null) {
			return widget.buildAwaitSearch(context);
		}

		return AwaitWidget(UsefulWidgetsLocalizations.of(context)[SearchWidgetMessages.searchingMessage]);
	}

	void search(BuildContext context, String query) {
		controller.futureSearch = widget.search(context, query);
	}

	void close(BuildContext context) {
		Navigator.of(context).pop();
	}

	void listener() {
		setState(() {});
	}

	@override
	void dispose() {
    	controller.removeListener(listener);
		super.dispose();
	}
}