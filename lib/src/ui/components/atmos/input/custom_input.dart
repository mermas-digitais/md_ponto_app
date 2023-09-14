import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final TextInputType keyboardType;
  final bool? autoFocus;
  final TextEditingController? controller;
  final int? maxLines;

  const CustomInput({
    super.key,
    required this.label,
    required this.onChanged,
    this.validator,
    this.height,
    this.width,
    required this.keyboardType,
    this.autoFocus,
    this.controller,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        keyboardType: keyboardType,
        autofocus: autoFocus ?? false,
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        textAlign: TextAlign.start,
        maxLines: maxLines ?? 1,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: label,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          isDense: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.4)),
          ),
        ),
      ),
    );
  }
}
