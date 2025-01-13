import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_time/core/common/style/style.dart';

import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => const Icon(
          Icons.image_not_supported_outlined,
          size: 50,
        ),
        fit: BoxFit.cover,
        imageUrl: completeImageUrl(imageUrl),
      ),
    );
  }
}
