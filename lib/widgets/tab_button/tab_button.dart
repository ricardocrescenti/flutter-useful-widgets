import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {

	final IconData? icon;
	final String? text;

	const TabButton({
		Key? key,
		this.icon,
		this.text
	}): super(key: key);


	@override
	Widget build(BuildContext context) {

		List<Widget> widgets = [];

		if (icon != null) {
			widgets.add(Icon(icon, color: Theme.of(context).iconTheme.color,));
		}

		if (text != null) {
			if (icon != null) {
				widgets.add(const Padding(
					padding: EdgeInsets.all(2)
				));
			}
			widgets.add(Text(text!, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10)));
		}

		return Container(
			padding: const EdgeInsets.all(3),
			child: Column(
				mainAxisSize: MainAxisSize.min,
				children: widgets,
			),
		);
	}
}