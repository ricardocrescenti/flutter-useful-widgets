import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:useful_widgets/localizations/localizations_enums.dart';
import 'package:useful_widgets/useful_widgets.dart';

class AppleLoginButton extends StatelessWidget{
  final String text;
  final bool rouded;
  final Function(BuildContext context) onPressed;

  AppleLoginButton({
    this.text,
    this.rouded = false,
    @required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButton(
      rouded: this.rouded,
      icon: FontAwesomeIcons.apple,
      buttonColor: Colors.black,
      textColor: Colors.white,
      text: this.text ?? UsefulWidgetsLocalizations.of(context)[SocialButtonsMessages.apple],
      onPressed: this.onPressed);
  }
}