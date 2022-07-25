import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:useful_widgets/useful_widgets.dart';

class TwitterLoginButton extends StatelessWidget{

	final String? text;
	final bool rouded;
	final Function(BuildContext context) onPressed;

	const TwitterLoginButton({
		Key? key,
		this.text,
		this.rouded = false,
		required this.onPressed,
	}): super(key:  key);
	
	@override
	Widget build(BuildContext context) {

		return DefaultSocialButton(
			rouded: rouded,
			icon: FontAwesomeIcons.twitter,
			buttonColor: const Color.fromRGBO(27, 161, 242, 1),
			textColor: Colors.white,
			text: text ?? UsefulWidgetsLocalizations.of(context)[SocialButtonsMessages.twitter],
			onPressed: onPressed);

	}
}