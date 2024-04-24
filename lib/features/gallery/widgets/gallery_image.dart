import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryImage extends StatelessWidget {
  const GalleryImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          fadeInDuration: const Duration(milliseconds: 500),
          fadeInCurve: Curves.easeInOut,
          errorWidget: (context, url, error) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.error_outline,
              color: Colors.black,
            ),
          ),
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
