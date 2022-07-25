import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {

	final dynamic image;
	final Widget? emptyImage;
	final BoxFit boxFit;
	final BorderRadius? borderRadius;
	final BoxConstraints? constraints;
	final EdgeInsetsGeometry? padding;

	const ImageWidget({
		Key? key,
		required this.image,
		this.emptyImage,
		this.boxFit = BoxFit.contain,
		this.borderRadius,
		this.constraints,
		this.padding
	}): super(key: key);

	@override
	Widget build(BuildContext context) {
		
		Widget child;

		if (image == null || (image is String && image.isEmpty)) {
			child = emptyImage ?? Container();
		}

		child = (image is Future
			? _buildFutureImage()
			: _buildImage(image)
		);

		if (borderRadius != null) {
			child = ClipPath(
				clipper: (borderRadius != null ? ShapeBorderClipper(
					shape: RoundedRectangleBorder(
						borderRadius: borderRadius! //BorderRadius.circular(5)
					)
				) : null),
				child: child
			);
		}

		return Container(
			constraints: constraints,
			padding: padding,
			child: child
		);

	}

	_buildFutureImage() {

		return FutureBuilder(
			future: image,
			builder: (context, snapshot) {

				if (snapshot.connectionState == ConnectionState.waiting) {
					return _buildAwaitWidget(context);
				} else if (snapshot.error != null) {
					return _buildErrorWidget(context);
				} else {
					return _buildImage(snapshot.data);
				}

			},

		);

	}

	_buildAwaitWidget(BuildContext context) {

		return const Center(
			child: CircularProgressIndicator(
			)
		);

	}

	_buildErrorWidget(BuildContext context) {
		return const Icon(Icons.error);
	}

	_buildImage(dynamic image) {

		if (image == null || (image is String && image.isEmpty)) {
			return emptyImage ?? Container();
		}

		if (image is File) {
			
			return Image.file(image, 
				width: double.infinity, 
				height: double.infinity, 
				fit: boxFit
			);

		} else if (image is String) {
			
			return CachedNetworkImage(
				imageUrl: image, 
				width: double.infinity, 
				height: double.infinity, 
				fit: boxFit
			);
		}

	}
}