import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final void Function(String) onSubmitted;
  final double? height;
  final double? width;

  const Input(
      {super.key,
      required this.label,
      required this.onSubmitted,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: width ?? MediaQuery.of(context).size.width,
      child: TextField(
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: label,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }
}
