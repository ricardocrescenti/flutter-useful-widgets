import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  final Widget title;
  final bool showContinueButton;
  final Widget continueButton;
  final Future<bool> Function(BuildContext context) onContinue;
  final Future<bool> Function(BuildContext context) onCancel;
  final Widget Function(BuildContext context) builder;

  StepWidget({
    this.title,
    this.showContinueButton = true,
    this.continueButton,
    this.onContinue,
    this.onCancel,
    this.builder
  });
  
  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}