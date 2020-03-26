import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:useful_widgets/useful_widgets.dart';

class MicrosoftLoginButton extends StatelessWidget{
  final String text;
  final bool rouded;
  final Function(BuildContext context) onPressed;

  MicrosoftLoginButton({
    this.text,
    this.rouded = false,
    @required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButtonLogin(
      rouded: this.rouded,
      icon: FontAwesomeIcons.microsoft,
      buttonColor: Color.fromRGBO(0, 24, 142, 1),
      textColor: Colors.white,
      text: this.text ?? UsefulWidgetsLocalizations.of(context)[SocialButtonsMessages.microsoft],
      onPressed: this.onPressed);
  }
}