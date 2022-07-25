import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:useful_widgets/useful_widgets.dart';

class MicrosoftLoginButton extends StatelessWidget{

	final String? text;
	final bool rouded;
	final Function(BuildContext context) onPressed;

	const MicrosoftLoginButton({
		Key? key,
		this.text,
		this.rouded = false,
		required this.onPressed,
	}): super(key:  key);
	
	@override
	Widget build(BuildContext context) {

		return DefaultSocialButton(
			rouded: rouded,
			icon: FontAwesomeIcons.microsoft,
			buttonColor: const Color.fromRGBO(0, 24, 142, 1),
			textColor: Colors.white,
			text: text ?? UsefulWidgetsLocalizations.of(context)[SocialButtonsMessages.microsoft],
			onPressed: onPressed);

	}
}