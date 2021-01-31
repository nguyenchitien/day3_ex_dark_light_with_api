import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleLoadingImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const CircleLoadingImage(this.url, {Key key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(width == double.infinity ? 500 : width / 2),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.cover,
        imageUrl: url,
        placeholder: (context, url) =>
            Container(width: width, height: height, color: Colors.grey),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
