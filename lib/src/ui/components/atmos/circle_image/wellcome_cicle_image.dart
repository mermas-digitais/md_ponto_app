import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      height: 205,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Transform.scale(
        scale: 0.5,
        child:
         SvgPicture.asset(
          'lib/src/ui/assets/default-image.svg',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          semanticsLabel: 'imagem padrão',
        ),
      ),
    );
  }
}
