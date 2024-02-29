import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class custombookitem extends StatelessWidget {
  const custombookitem(
      {super.key, required this.aspect, required this.imageurl});
  final double aspect;
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: aspect,
        child: CachedNetworkImage(
          imageUrl: imageurl,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
