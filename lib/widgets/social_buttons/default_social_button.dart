import 'package:flutter/material.dart';

class DefaultSocialButton extends StatelessWidget{

	final bool rouded;
	final IconData icon;
	final Color buttonColor;
	final Color textColor;
	final String text;
	final Function(BuildContext context) onPressed;

	const DefaultSocialButton({
		Key? key,
		required this.rouded,
		required this.icon, 
		required this.buttonColor, 
		required this.textColor, 
		required this.text, 
		required this.onPressed
	}): super(key:  key);

	@override
	Widget build(BuildContext context) {

		return (rouded
			? _buildRoudedButton(context)
			: _buildRaisedButton(context));

	}

	_buildRoudedButton(BuildContext context) {

		return SizedBox(
			width: 37,
			child: ElevatedButton(
				style: ElevatedButton.styleFrom(
					primary: buttonColor,
					onPrimary: textColor,
					tapTargetSize: MaterialTapTargetSize.padded,
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(20.0),),
				),
				onPressed: () => onPressed(context),
				child: Padding(
					padding: const EdgeInsets.only(left: 12),
					child: Icon(icon, size: 20, textDirection: TextDirection.rtl,),
				),
			),
		);

	}

	_buildRaisedButton(BuildContext context) {

		return ElevatedButton(
			style: ElevatedButton.styleFrom(
				primary: buttonColor,
				onPrimary: textColor,
				tapTargetSize: MaterialTapTargetSize.padded,
			),
			onPressed: () => onPressed(context),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					Icon(icon, size: 20),
					const Padding(padding: EdgeInsets.only(left: 10)),
					Text(text),
				],
			),
		);

	}
}