import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final TextInputType keyboardType;

  const Input({
    super.key,
    required this.label,
    required this.onChanged,
    this.height,
    this.width,
    this.validator,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        keyboardType: keyboardType,
        autofocus: true,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: label,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          isDense: true,
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
