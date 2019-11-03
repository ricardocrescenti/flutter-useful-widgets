import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:useful_widgets/useful_widgets.dart';

import 'active_page_enum.dart';

abstract class SearchWidget<T> extends StatefulWidget {
  final hintText;

  SearchWidget({
    this.hintText = 'Pesquisar'
  });

  AppBar buildAppBar(BuildContext context, SearchWidgetState<T> searchWidget) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleSpacing: 4,
      title: TextField(
        autofocus: true,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: hintText,
          prefixIcon: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => close(context),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () => searchWidget.performSearch(searchWidget.textEditingController.text)
          )
        ),
        controller: searchWidget.textEditingController,
        style: Theme.of(context).textTheme.title,
        onSubmitted: (value) => searchWidget.performSearch(value)
      ),
      automaticallyImplyLeading: false,
    );
  }
  Widget buildSugestion(BuildContext context) {
    return Container();
  }
  Widget buildResult(BuildContext context, T result);

  bool canSearch(BuildContext context, String query) {
    return true;
  }

  Future<T> search(String query);

  close(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  State<StatefulWidget> createState() => SearchWidgetState<T>();
}

class SearchWidgetState<T> extends State<SearchWidget<T>> {
  Future _future;
  ActivePage _activePage = ActivePage.Sugestion;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.buildAppBar(context, this),
      body: _buildBody()
    );
  }

  performSearch(String query) {
    if (widget.canSearch(context, query)) {
      setState(() {
        this._activePage = ActivePage.Result;
        this._future = widget.search(query);
      });
    }
  }

  _buildBody() {
    if (_activePage == ActivePage.Result) {
      return FutureWidget<T>(
        future: (context) => this._future,
        builder: (context, result) {
          return widget.buildResult(context, result);
        }
      );
    } else {
      return widget.buildSugestion(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}