import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:useful_widgets/useful_widgets.dart';

class GitHubLoginButton extends StatelessWidget{
  final String text;
  final bool rouded;
  final Function(BuildContext context) onPressed;

  GitHubLoginButton({
    this.text,
    this.rouded = false,
    @required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return DefaultSocialButton(
      rouded: this.rouded,
      icon: FontAwesomeIcons.github,
      buttonColor: Color.fromRGBO(27, 30, 33, 1),
      textColor: Colors.white,
      text: this.text ?? UsefulWidgetsLocalizations.of(context)[SocialButtonsMessages.github],
      onPressed: this.onPressed);
  }
}