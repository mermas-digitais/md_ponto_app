import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final TextInputType keyboardType;
  final bool? autoFocus;

  const Input({
    super.key,
    required this.label,
    required this.onChanged,
    required this.keyboardType,
    this.height,
    this.width,
    this.validator,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        keyboardType: keyboardType,
        autofocus: autoFocus ?? false,
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
