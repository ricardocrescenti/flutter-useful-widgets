import 'package:flutter/material.dart';

import 'await_widget.dart';
import 'error_widget.dart' as error_widget;

class FutureWidget<T> extends StatefulWidget {
  final Future<T> Function(BuildContext context) load;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context) awaitWidget;
  final Widget Function(BuildContext context, Object error, Function retry) errorWidget;
  final bool allowRetry;
  final String awaitMessage;
  final String errorMessage;
  
  FutureWidget({
    @required this.load,
    @required this.builder,
    this.awaitWidget,
    this.errorWidget,
    this.allowRetry = false,
    this.awaitMessage,
    this.errorMessage,
  });

  @override
  State<StatefulWidget> createState() => _FutureWidgetState<T>();
}

class _FutureWidgetState<T> extends State<FutureWidget<T>> {
  Future<T> _futureLoad;

  @override
  void initState() {
    super.initState();
    this._load(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _futureLoad,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildAwaitWidget(context);
        } else if (snapshot.error != null) {
          return _buildErrorWidget(context, snapshot.error);
        } else {
          return widget.builder(context, snapshot.data);
        }
        
      }
    );
  }

  _buildAwaitWidget(BuildContext context) {
    return (widget.awaitWidget != null 
      ? widget.awaitWidget(context) 
      : AwaitWidget(widget.awaitMessage));
  }

  _buildErrorWidget(BuildContext context, Object error) {
    return (widget.errorWidget != null 
      ? widget.errorWidget(context, error, _load) 
      : error_widget.ErrorWidget(widget.errorMessage, (widget.allowRetry ? _load : null)));
  }

  _load(BuildContext context) {
    bool canSetState = (_futureLoad == null);    
    _futureLoad = widget.load(context);
    if (canSetState) {
      setState(() {});
    }
  }
}