import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/theme/theme.dart';

class CustomInput extends StatelessWidget {
  factory CustomInput({
    Key? key,
    required String label,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    double? height,
    double? width,
    required TextInputType keyboardType,
    bool? autoFocus,
    TextEditingController? controller,
    int? maxLines,
    Widget? iconButton,
    bool? isObscureText,
    void Function(String?)? onSaved,
  }) {
    return (CustomInput._(
      key: key,
      label: label,
      keyboardType: keyboardType,
      onChanged: onChanged,
      autoFocus: autoFocus,
      controller: controller,
      width: width,
      height: height,
      maxLines: maxLines,
      validator: validator,
      iconButton: iconButton,
      isObscureText: isObscureText,
      onSaved: onSaved,
    ));
  }

  factory CustomInput.variant({
    Key? key,
    required String label,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    double? height,
    double? width,
    required TextInputType keyboardType,
    bool? autoFocus,
    TextEditingController? controller,
    int? maxLines,
    bool? variant = true,
    Widget? iconButton,
    bool? isObscureText,
    void Function(String?)? onSaved,
  }) {
    return (CustomInput._(
      key: key,
      label: label,
      keyboardType: keyboardType,
      onChanged: onChanged,
      autoFocus: autoFocus,
      controller: controller,
      width: width,
      height: height,
      maxLines: maxLines,
      validator: validator,
      variant: variant,
      iconButton: iconButton,
      isObscureText: isObscureText,
      onSaved: onSaved,
    ));
  }

  const CustomInput._({
    Key? key,
    required this.label,
    this.onChanged,
    this.validator,
    this.height,
    this.width,
    required this.keyboardType,
    this.autoFocus,
    this.controller,
    this.maxLines,
    this.variant,
    this.iconButton,
    this.isObscureText,
    this.onSaved,
  });

  final String label;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final TextInputType keyboardType;
  final bool? autoFocus;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? variant;
  final Widget? iconButton;
  final bool? isObscureText;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    final InputBorder borderConfig = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: variant == true
            ? Theme.of(context).colorScheme.background.withOpacity(0.4)
            : Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
      ),
    );

    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        obscureText: isObscureText == true,
        cursorColor: variant == true
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.primary,
        keyboardType: keyboardType,
        autofocus: autoFocus ?? false,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        maxLines: maxLines ?? 1,
        style: variant == true
            ? Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14)
            : Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          hintText: label,
          errorStyle: variant == true
              ? Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10, color: lightTheme().colorScheme.error)
              : Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10, color: lightTheme().colorScheme.error),
          hintStyle:
              variant == true ? Theme.of(context).textTheme.bodyMedium : null,
          labelStyle: variant == true
              ? Theme.of(context).textTheme.bodyMedium
              : Theme.of(context).textTheme.bodyMedium,
          filled: true,
          fillColor: variant == true
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
          isDense: false,
          suffixIcon: iconButton,
          border: borderConfig,
          focusedBorder: borderConfig,
          enabledBorder: borderConfig,
        ),
      ),
    );
  }
}
