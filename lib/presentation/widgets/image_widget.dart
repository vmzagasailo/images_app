import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:images_app/presentation/resources/app_images.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;

  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Image.asset(
          AppImages.defaultImage,
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, err) => Image.asset(
          AppImages.defaultImage,
          fit: BoxFit.cover,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
