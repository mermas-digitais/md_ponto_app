import 'package:flutter/material.dart';

class CustomButton {
  final BuildContext context;

  CustomButton(this.context);

  active(label, onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  inactive() {
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
                    .withOpacity(0.3),
              )),
    );
  }
}
