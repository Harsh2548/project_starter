import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

class CacheImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final double scale;
  final Color? selectedColor;
  final Color? bgcolor;
  final Border? border;
  final Widget? errorWidget;

  const CacheImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.scale = 1.0,
    this.selectedColor,
    this.bgcolor = Colors.transparent,
    this.border,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: borderRadius,
          border: border,
          image: shape == BoxShape.circle
              ? DecorationImage(
            image: imageProvider,
            fit: fit,
            scale: scale,
          )
              : null,
        ),
        child: shape == BoxShape.circle
            ? null
            : Image(image: imageProvider, fit: fit, color: selectedColor),
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(5),
        child: const CupertinoActivityIndicator(
          radius: 10.0,
          color: AppColors.primaryColor,
          animating: true,
        ),
      ),
      errorWidget: (context, url, error) => errorWidget ??
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.shimmerHighlightColor,
              borderRadius: borderRadius,
              shape: shape,
              border: border,
            ),
            child: const Icon(
              Icons.broken_image_outlined,
              color: Colors.grey,
            ),
          ),
    );
  }
}