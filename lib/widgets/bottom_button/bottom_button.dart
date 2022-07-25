import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

	final Color? color;
	final Color? textColor;
	final Function() onPressed;
	final Widget child;

	const BottomButton({
		Key? key,
		this.color,
		this.textColor,
		required this.onPressed,
		required this.child
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {

		return ElevatedButton(
			style: ElevatedButton.styleFrom(
				padding: const EdgeInsets.all(15),
				primary: (color ?? (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryColor)),
				onPrimary: (textColor ?? (Theme.of(context).brightness == Brightness.dark ? null : Theme.of(context).primaryTextTheme.headline6!.color)),
				tapTargetSize: MaterialTapTargetSize.shrinkWrap,
			),
			onPressed: onPressed,
			child: child,
		);

	}
}