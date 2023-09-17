import 'package:flutter/material.dart';

class CustomButton {
  final BuildContext context;

  CustomButton({required this.context});

  active({required String label, required void Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label,
          style:
              Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14)),
    );
  }

  inactive({required String label, required void Function()? onPressed}) {
    return TextButton(
      style: Theme.of(context).textButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4)),
          overlayColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.surfaceVariant)),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('Cancelar',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurfaceVariant
                    .withOpacity(0.4),
              )),
    );
  }

  withIconRight({
    required String label,
    required void Function()? onPressed,
    required Widget icon,
  }) {
    return IntrinsicWidth(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 14),
            ),
            const SizedBox(
              width: 12,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
