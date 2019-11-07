# useful_widgets

This package makes it easy to build apps by providing a list of simple and useful widgets.

```dart
import 'package:useful_widgets/useful_widgets.dart';
```

List of Widgets available in this package

- FutureWidget
- RefreshWidget
- SearchWidget

Below I will explain how each widget is used

## FutureWidget

Simple widget to show result widget when `Future` is done, this widget automatic show loading widget, and error widget.

```dart
Future<String> delayedFuture;

Function() createDelayedFuture = () {
    delayedFuture = Future.delayed(Duration(seconds: 5), () => 'FutureWidget');
};

createDelayedFuture();

FutureWidget<String>(
    future: (context) => delayedFuture,
    retry: (context) => createDelayedFuture(),
    builder: (context, result) => Text(result),
)
```

The 'Retry' button only is showed if `retry` parameter is informed.

## RefreshWidget



## SearchWidget

