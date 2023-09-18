import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/components/componentes.dart';
import 'package:md_ponto_app/src/ui/theme/theme.dart';

class ProfileCircleAvatar extends StatelessWidget {
  final double radius;
  final String image;
  final bool? light;
  final BoxDecoration? decoration;
  final Widget? child;

  const ProfileCircleAvatar._({
    super.key,
    required this.radius,
    required this.image,
    this.decoration,
    this.child,
    this.light,
  });

  factory ProfileCircleAvatar.profile({
    Key? key,
    required double radius,
    required String image,
  }) {
    return ProfileCircleAvatar._(
      key: key,
      radius: radius,
      image: image,
      // decoration: BoxDecoration(
      //     border:
      //         Border.all(color: lightTheme().colorScheme.background, width: 4),
      //     borderRadius: BorderRadius.circular(100)),
      child: CircleAvatar(
        radius: 36,
        backgroundColor: lightTheme().colorScheme.secondary.withOpacity(0.8),
        child: ImageProfilePhoto(
          image: image,
          height: 62,
          width: 62,
        ),
      ),
    );
  }
  factory ProfileCircleAvatar.normal({
    Key? key,
    required double? radius,
    required String image,
  }) {
    return ProfileCircleAvatar._(
      key: key,
      radius: radius ?? 38,
      image: image,
      decoration: BoxDecoration(
          border:
              Border.all(color: lightTheme().colorScheme.background, width: 4),
          borderRadius: BorderRadius.circular(100)),
      child: CircleAvatar(
        radius: radius ?? 38,
        backgroundColor: lightTheme().colorScheme.secondary.withOpacity(0.6),
        child: ImageProfilePhoto(
          image: image,
          height: 80,
          width: 80,
        ),
      ),
    );
  }
  factory ProfileCircleAvatar.small({
    Key? key,
    required double radius,
    required String image,
    bool? light,
  }) {
    return ProfileCircleAvatar._(
      key: key,
      radius: radius,
      image: image,
      light: light,
      decoration: BoxDecoration(
        border:
            Border.all(color: lightTheme().colorScheme.background, width: 1.5),
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: light == false
            ? lightTheme().colorScheme.primary.withOpacity(0.4)
            : lightTheme().colorScheme.secondary.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(0.5),
          child: ImageProfilePhoto(
            image: image,
            height: 60,
            width: 60,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: decoration ??
          BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: lightTheme().colorScheme.background, width: 0.1),
          ),
      child: ClipRRect(borderRadius: BorderRadius.circular(100), child: child),
    );
  }
}
