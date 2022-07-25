import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {

	final int iconCount;
	final int currentRating;
	final double iconSize;
	final Color markedColor;
	final Color unmarkedColor;
	final Widget Function(bool marked)? iconBuilder;

	const RatingWidget({
		Key? key,
		required this.iconCount,
		required this.currentRating,
		this.iconSize = 15,
		this.markedColor = Colors.grey,
		this.unmarkedColor = Colors.orange,
		this.iconBuilder,
	}): super(key: key);

	@override
	Widget build(BuildContext context) {

		return Row(
			children: _buildIcons(),
		);

	}

	List<Widget> _buildIcons() {

		List<Widget> icons = [];

		for (var i = 0; i < iconCount; i++) {
			bool marked = (currentRating <= i);
			icons.add(iconBuilder != null 
				? iconBuilder!(marked) 
				: _buildIcon(marked)
			);
		}

		return icons;

	}

	Widget _buildIcon(bool marked) {
		return Icon(Icons.star, 
			size: iconSize,
			color: (marked ? markedColor : unmarkedColor)
		);
	}
		
}