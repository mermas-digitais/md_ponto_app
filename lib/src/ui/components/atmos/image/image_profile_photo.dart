import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageProfilePhoto extends StatelessWidget {
  final String image;
  final double? height, width;
  const ImageProfilePhoto({
    super.key,
    required this.image,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return image.toString().contains("http")
        ? CachedNetworkImage(
            memCacheHeight: 2000,
            memCacheWidth: 2000,
            progressIndicatorBuilder: (context, url, progress) => SizedBox(
                height: height ?? 22,
                width: width ?? 22,
                child: const CircularProgressIndicator(
                  color: Color.fromARGB(255, 221, 199, 248),
                )),
            errorWidget: (context, url, error) => SvgPicture.asset(
              alignment: Alignment.center,
              fit: BoxFit.contain,
              semanticsLabel: 'Avatar',
              'lib/src/ui/assets/avatars/avatar0.svg',
            ),
            imageUrl: image.toString(),
            imageBuilder: (context, imageProvider) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : SvgPicture.asset(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            semanticsLabel: 'Avatar',
            'lib/src/ui/assets/avatars/avatar$image.svg',
          );
  }
}
