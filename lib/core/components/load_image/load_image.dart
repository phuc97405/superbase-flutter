import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoadImage extends StatelessWidget {
  final String? url;
  final BoxFit? boxFit;
  final double? borderRadius;
  final double? width;
  final double? height;
  final bool loading;

  const LoadImage(
      {super.key,
      required this.url,
      this.boxFit,
      this.borderRadius,
      this.width,
      this.height,
      this.loading = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        width: width,
        height: height,
        memCacheHeight: height?.toInt(),
        memCacheWidth: width?.toInt(),
        imageUrl: url != null && url?.isNotEmpty == true
            ? url!
            : 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.cover,
              // colorFilter:
              //     const ColorFilter.mode(Colors.red, BlendMode.colorBurn)
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, progress) => loading
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox(),
        // placeholder: (context, url) => imageDefault ?? 0.ph,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
