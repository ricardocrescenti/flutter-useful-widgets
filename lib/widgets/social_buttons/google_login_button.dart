import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:useful_widgets/useful_widgets.dart';

class GoogleLoginButton extends StatelessWidget{

	final String? text;
	final bool rouded;
	final Function(BuildContext context) onPressed;

	const GoogleLoginButton({
		Key? key,
		this.text,
		this.rouded = false,
		required this.onPressed,
	}): super(key:  key);
	
	@override
	Widget build(BuildContext context) {

		return DefaultSocialButton(
			rouded: rouded,
			icon: FontAwesomeIcons.google,
			buttonColor: const Color.fromRGBO(207, 67, 50, 1),
			textColor: Colors.white,
			text: text ?? UsefulWidgetsLocalizations.of(context)[SocialButtonsMessages.google],
			onPressed: onPressed);

	}
}