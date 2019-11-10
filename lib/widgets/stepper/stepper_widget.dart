import 'package:flutter/material.dart';
import 'package:useful_widgets/widgets/stepper/step_widget.dart';

class StepperWidget extends StatefulWidget {
  final bool showStepTitle;
  final bool centerTitle;
  final List<StepWidget> steps;
  final Widget continueButton;
  final Widget finalizeButton;
  final Future<bool> Function(BuildContext context) onFinalize;

  StepperWidget({
    this.showStepTitle = false,
    this.centerTitle = false,
    @required this.steps,
    this.continueButton = const Text('CONTINUE'),
    this.finalizeButton = const Text('FINALIZE'),
    this.onFinalize
  });
  
  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backToPreviousStep(context),
      child: Scaffold(
        appBar: buildAppBar(),
        body: widget.steps[currentStep],
        bottomNavigationBar: buildContinueButton(context),
      ),
    );
  }

  buildAppBar() {
    if (widget.showStepTitle) {
      return AppBar(
        title: widget.steps[currentStep].title,
        centerTitle: widget.centerTitle,
      );
    }
    return null;
  }

  buildContinueButton(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15),
      color: (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryColor),
      textColor: (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryTextTheme.title.color),
      child: (currentStep == widget.steps.length - 1 ? widget.finalizeButton : widget.continueButton),
      onPressed: () => goToNextStep(context),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Future<bool> backToPreviousStep(BuildContext context) async {
    bool canCancel = true;
    if (widget.steps[currentStep].onCancel != null) {
      canCancel = await widget.steps[currentStep].onCancel(context);
    }
    print('canCancel ' + canCancel.toString());

    if (canCancel) {
      if (currentStep > 0) {
        setState(() {
          currentStep--;
        });
        print('currentStep ' + currentStep.toString());
      } else {
        print('close ' + currentStep.toString());
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
    print('canContinue ' + canContinue.toString());

    if (canContinue) {
      if (currentStep < widget.steps.length - 1) {
        setState(() {
          currentStep++;
        });
      }
      else {
        bool canFinalize = true;
        if (widget.onFinalize != null) {
          canFinalize = await widget.onFinalize(context);
        }
        print('canFinalize ' + canFinalize.toString());

        if (canFinalize) {
          Navigator.of(context).pop();
        }
      }
    }
  }
}