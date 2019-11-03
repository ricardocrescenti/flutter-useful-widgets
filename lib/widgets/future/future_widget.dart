import 'package:flutter/material.dart';

import 'await_widget.dart';
import 'error_widget.dart' as error_widget;

class FutureWidget<T> extends StatefulWidget {
  final Future<T> Function(BuildContext context) future;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context) awaitWidget;
  final Widget Function(BuildContext context, Object error, Function retry) errorWidget;
  final Function(BuildContext context) retry;
  final String awaitMessage;
  final String errorMessage;
  
  FutureWidget({
    @required this.future,
    @required this.builder,
    this.awaitWidget,
    this.errorWidget,
    this.retry,
    this.awaitMessage = 'Carregando',
    this.errorMessage = 'Não foi possível efetuar a requisição solicitada.',
  });

  @override
  State<StatefulWidget> createState() => _FutureWidgetState<T>();
}

class _FutureWidgetState<T> extends State<FutureWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: widget.future(context),
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
      ? widget.errorWidget(context, error, _performRetry) 
      : error_widget.ErrorWidget(widget.errorMessage, (widget.retry != null ? _performRetry : null)));
  }

  _performRetry(BuildContext context) {
    if (widget.retry != null) {
      widget.retry(context);
      setState(() {});
    }
  }
}