import 'package:flutter/widgets.dart';
import 'package:useful_widgets/useful_widgets.dart';

/// This class is used on `build()` method of the `Module` to pass the module
/// reference to its descendants
class InheritedStepper extends InheritedWidget {
  final StepperWidgetState stepper;
  InheritedStepper({
    Key key, 
    @required this.stepper, 
    @required Widget child }) : super(key: key, child: child);
    
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}