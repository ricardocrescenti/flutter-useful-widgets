import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';

class SearchController<T> extends ChangeNotifier {
	ActivePage _activePage = ActivePage.sugestion;
	ActivePage get activePage => _activePage;
	set activePage(ActivePage value) {
		_activePage = value;
		notifyListeners();
	}

	Future<T> _futureSearch;
	Future<T> get futureSearch => _futureSearch;
	set futureSearch(Future<T> value) {
		_futureSearch = value;
		activePage = ActivePage.result;
	}
}