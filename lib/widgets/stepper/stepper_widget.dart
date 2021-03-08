import 'package:flutter/material.dart';
import 'package:useful_widgets/useful_widgets.dart';
import 'package:useful_widgets/widgets/stepper/inherited_stepper.dart';

class StepperWidget extends StatefulWidget {
  final bool showStepTitle;
  final bool centerTitle;
  final Widget continueButton;
  final Widget finalizeButton;
  final Future<bool> Function(BuildContext context) onWillPop;
  final Future<void> Function(BuildContext context) onFinalize;
  final List<StepWidget> steps;

  StepperWidget({
    this.showStepTitle = false,
    this.centerTitle = false,
    this.continueButton = const Text('CONTINUE'),
    this.finalizeButton = const Text('FINALIZE'),
    this.onWillPop,
    this.onFinalize,
    @required this.steps,
  });
  
  @override
  StepperWidgetState createState() => StepperWidgetState();
}

class StepperWidgetState extends State<StepperWidget> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backToPreviousStep(context),
      child: InheritedStepper(
        stepper: this,
        child: Scaffold(
          appBar: buildAppBar(),
          body: widget.steps[currentStep],
          bottomNavigationBar: buildContinueButton(context),
        ),
      ),
    );
  }

  buildAppBar() {
    if (widget.showStepTitle) {
      return widget.steps[currentStep].appBar;
    }
    return null;
  }

  buildContinueButton(BuildContext context) {
    if (!widget.steps[currentStep].showContinueButton) {
      return null;
    }

    return ElevatedButton(
      child: (currentStep == widget.steps.length - 1 ? widget.finalizeButton : (widget.steps[currentStep].continueButton != null ? widget.steps[currentStep].continueButton : widget.continueButton)),
      style: ElevatedButton.styleFrom(
        primary: (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryColor),
        onPrimary: (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryTextTheme.headline6.color),
        padding: EdgeInsets.all(15),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () => goToNextStep(context),
    );
  }

  Future<bool> backToPreviousStep(BuildContext context) async {
    bool canCancel = true;
    if (widget.steps[currentStep].onCancel != null) {
      canCancel = await widget.steps[currentStep].onCancel(context);
    }

    if (currentStep == 0 && widget.onWillPop != null) {
      canCancel = await widget.onWillPop(context);
    }

    if (canCancel) {
      if (currentStep > 0) {
        setState(() {
          currentStep--;
        });
      } else {
        return true;
      }
    }
    return false;
  }

  goToNextStep(BuildContext context) async {
    bool canContinue = true;
    if (widget.steps[currentStep].onContinue != null) {
      canContinue = await widget.steps[currentStep].onContinue(context);
    }

    if (canContinue) {
      if (currentStep < widget.steps.length - 1) {
        setState(() {
          currentStep++;
        });
      }
      else {
        if (widget.onFinalize != null) {
          await widget.onFinalize(context);
        } else {
          Navigator.of(context).pop();
        }
      }
    }
  }
}